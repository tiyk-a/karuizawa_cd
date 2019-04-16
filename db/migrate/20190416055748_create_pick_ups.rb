class CreatePickUps < ActiveRecord::Migration[5.2]
  def change
    create_table :pick_ups do |t|
      t.integer :cd_id
      t.string :pickup_title
      t.text :pickup_body

      t.timestamps
    end
  end
end
