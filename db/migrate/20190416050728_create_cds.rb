class CreateCds < ActiveRecord::Migration[5.2]
  def change
    create_table :cds do |t|
      t.string :cd_title
      t.string :cd_image_id
      t.integer :stock
      t.text :cd_profile
      t.integer :price
      t.integer :artist_id
      t.integer :label_id
      t.integer :category_id

      t.timestamps
    end
  end
end
