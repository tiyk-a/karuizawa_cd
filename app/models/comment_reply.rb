class CommentReply < ApplicationRecord
	belongs_to :comment
	belongs_to :user
	validates :user_id, presence: true
	validates :comment_id, presence: true
	validates :comment_reply_body, presence: true
end