class Cd < ApplicationRecord
	has_many :favorites, dependent: :destroy
	belongs_to :artist
	belongs_to :label
	belongs_to :category
	has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :comment_replies, through: :comments, dependent: :destroy
end
