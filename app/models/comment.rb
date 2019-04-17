class Comment < ApplicationRecord
	belongs_to :cd
	has_many :comment_replies, dependent: :destroy
	accepts_nested_attributes_for :comment_replies
	belongs_to :user
	validates :user_id, presence: true
	validates :cd_id, presence: true
	validates :comment_body, presence: true
end