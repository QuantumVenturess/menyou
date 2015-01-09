class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :info
      t.boolean :spicy
      t.string :image
      t.float :small_price
      t.float :large_price
      t.integer :category_id

      t.timestamps
    end
    add_index :items, :name
    add_index :items, :info
    add_index :items, :spicy
    add_index :items, :image
    add_index :items, :small_price
    add_index :items, :large_price
    add_index :items, :category_id
  end
end
