class AddCfImageUrlToManhattan < ActiveRecord::Migration
  def change
    add_column :manhattans, :cf_image_url, :string
  end
end
