class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.integer :user_id
      t.string :inquiry_email
      t.integer :inquiry_category
      t.text :inquiry_body

      t.timestamps
    end
  end
end
