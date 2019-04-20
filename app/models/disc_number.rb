class DiscNumber < ApplicationRecord
	belongs_to :cd
	has_many :songs, dependent: :destroy
end
