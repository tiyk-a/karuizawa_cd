class CreateInquiryReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiry_replies do |t|
      t.integer :inquiry_id
      t.string :inquiry_reply_title
      t.text :inquiry_reply_body

      t.timestamps
    end
  end
end
