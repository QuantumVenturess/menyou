class CreateChefs < ActiveRecord::Migration
  def change
    create_table :chefs do |t|
      t.string :name
      t.text :info
      t.string :image

      t.timestamps
    end
    add_index :chefs, :name
    add_index :chefs, :info
    add_index :chefs, :image
  end
end
