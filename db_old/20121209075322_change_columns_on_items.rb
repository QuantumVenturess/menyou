class ChangeColumnsOnItems < ActiveRecord::Migration
  def change
  	change_column :items, :name, :string, unique: true
  	change_column :items, :spicy, :boolean, default: false
  end
end
