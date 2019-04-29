class Song < ApplicationRecord
	belongs_to :disc_number
	belongs_to :cd
end
