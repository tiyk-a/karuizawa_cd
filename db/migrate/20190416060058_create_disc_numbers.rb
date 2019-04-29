class CreateDiscNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :disc_numbers do |t|
      t.belongs_to :cd, foreign_key: true
      t.integer :disc_number

      t.timestamps
    end
  end
end
