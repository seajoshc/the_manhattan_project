class AddRocksToManhattans < ActiveRecord::Migration
  def change
    add_column :manhattans, :rocks, :boolean
  end
end
