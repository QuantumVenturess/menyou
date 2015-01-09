class AddSlugToChefs < ActiveRecord::Migration
  def change
    change_column :chefs, :name, :string, unique: true
    add_column :chefs, :slug, :string
    add_index :chefs, :slug
  end
end