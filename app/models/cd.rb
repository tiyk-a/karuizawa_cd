class Cd < ApplicationRecord
	has_many :favorites, dependent: :destroy
	belongs_to :artist
	belongs_to :label
	belongs_to :category
	has_many :favorites, dependent: :destroy
	accepts_nested_attributes_for :favorites
	has_many :comments, dependent: :destroy
	accepts_nested_attributes_for :comments
	has_many :comment_replies, through: :comments, dependent: :destroy
	attachment :cd_image
	has_one :pickup, inverse_of: :cd

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

end
