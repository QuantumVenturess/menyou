class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :encrypted_password
      t.string :salt
      t.string :slug
      t.boolean :admin

      t.timestamps
    end
    add_index :users, :name
    add_index :users, :email
    add_index :users, :slug
    add_index :users, :admin
  end
end
