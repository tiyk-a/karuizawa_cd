class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :song_name
      t.belongs_to :disc_number, foreign_key: true
      t.integer :song_order

      t.timestamps
    end
  end
end
