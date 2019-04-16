class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.datetime :planned_delivery_date
      t.datetime :ready_to_shipping_date
      t.datetime :shipping_date
      t.integer :delivery_status
      t.string :gift_address
      t.string :gift_postcode
      t.string :gift_name
      t.string :gift_phone_number

      t.timestamps
    end
  end
end
