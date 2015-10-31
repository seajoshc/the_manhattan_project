class CreateManhattans < ActiveRecord::Migration
  def change
    create_table :manhattans do |t|
      t.string :name
      t.text :recipe
      t.integer :num_cherries
      t.string :establishment
      t.string :city
      t.text :notes

      t.timestamps null: false
    end
  end
end
