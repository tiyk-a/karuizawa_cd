class CreateCommentReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_replies do |t|
      t.integer :user_id
      t.integer :comment_id
      t.string :comment_reply_body

      t.timestamps
    end
  end
end
