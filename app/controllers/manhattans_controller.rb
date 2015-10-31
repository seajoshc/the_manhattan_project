class ManhattansController < ApplicationController
  before_action :set_manhattan, only: [:show, :edit, :update, :destroy]

  # GET /manhattans
  # GET /manhattans.json
  def index
    @manhattans = Manhattan.all
  end

  # GET /manhattans/1
  # GET /manhattans/1.json
  def show
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
    params.require(:manhattan).permit(:name, :recipe, :num_cherries, :establishment, :city, :notes)
  end
end