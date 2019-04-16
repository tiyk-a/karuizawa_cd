class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :artist_name
      t.text :artist_profile
      t.string :artist_image_id

      t.timestamps
    end
  end
end
