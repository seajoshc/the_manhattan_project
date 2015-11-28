class ManhattansController < ApplicationController
  before_action :cache_stats
  before_action :set_manhattan, only: [:show, :edit, :update, :destroy]
  before_action :user_logged_in?, only: [:new, :edit, :create, :update, :destroy]

  # GET /manhattans
  # GET /manhattans.json
  def index
    @manhattans = Manhattan.all_cached
  end

  # GET /manhattans/1
  # GET /manhattans/1.json
  def show
    default_image if @manhattan.image.blank? || @manhattan.cf_image_url.blank?
  end

  # GET /manhattans/new
  def new
    @manhattan = Manhattan.new
  end

  # GET /manhattans/1/edit
  def edit
  end

  # POST /manhattans
  # POST /manhattans.json
  def create
    @manhattan = Manhattan.new(manhattan_params)
    image_name = params['manhattan']['image']

    unless params['manhattan']['image'].blank?
      image = upload_image(image_name)
      if image
        @manhattan.image = image
        @manhattan.cf_image_url = "#{CF_URL}/#{image_name}"
      else
        display_error('Image Upload Failed', :new)
        return false
      end # if
    end # unless

    respond_to do |format|
      if @manhattan.save
        format.html { redirect_to @manhattan, notice: 'Manhattan was successfully created.' }
        format.json { render :show, status: :created, location: @manhattan }
      else
        format.html { render :new }
        format.json { render json: @manhattan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manhattans/1
  # PATCH/PUT /manhattans/1.json
  def update
    respond_to do |format|
      if @manhattan.update(manhattan_params)
        format.html { redirect_to @manhattan, notice: 'Manhattan was successfully updated.' }
        format.json { render :show, status: :ok, location: @manhattan }
      else
        format.html { render :edit }
        format.json { render json: @manhattan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manhattans/1
  # DELETE /manhattans/1.json
  def destroy
    @manhattan.destroy
    respond_to do |format|
      format.html { redirect_to manhattans_url, notice: 'Manhattan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_manhattan
    @manhattan = Manhattan.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def manhattan_params
    params.require(:manhattan).permit(:name, :recipe, :num_cherries, :rocks,
                                      :establishment, :city, :notes, :image)
  end

  # Set default pictures
  def default_image
    ice = "#{ENV['CF_URL']}/manhattan_ice.jpg"
    no_ice = "#{ENV['CF_URL']}/manhattan_splash.jpg"

    if @manhattan.rocks?
      @manhattan.cf_image_url = ice
    else
      @manhattan.cf_image_url = no_ice
    end # if
  end # default_image

  # Upload image to s3
  def upload_image(image)
    # Make an object in bucket for upload
    obj = S3_BUCKET.object("manhattans/#{image.original_filename}")

    # Upload the file
    obj.put(acl: 'public-read', body: image)

    #
    obj.public_url
  rescue => e
    Rails.logger.fatal e
    return false
  end # process_image

  # Handle displaying error pages/codes
  def display_error(err_msg, action)
    respond_to do |format|
      flash[:alert] = err_msg
      format.html { render action }
      format.json { render json: err_msg, status: :unprocessable_entity }
    end # respond_to
  end # display_error
end # class
