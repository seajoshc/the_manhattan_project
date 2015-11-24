class AddImageToManhattan < ActiveRecord::Migration
  def change
    add_column :manhattans, :image, :string
  end
end
