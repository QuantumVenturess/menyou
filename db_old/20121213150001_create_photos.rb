class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :file

      t.timestamps
    end
    add_index :photos, :name
    add_index :photos, :file
  end
end
