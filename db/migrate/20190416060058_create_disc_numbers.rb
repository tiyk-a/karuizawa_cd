class CreateDiscNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :disc_numbers do |t|
      t.integer :cd_id
      t.integer :disc_number

      t.timestamps
    end
  end
end
