class Comment < ApplicationRecord
	belongs_to :cd
	has_many :comment_replies, dependent: :destroy
	belongs_to :user
end
