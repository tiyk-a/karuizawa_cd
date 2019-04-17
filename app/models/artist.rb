class Artist < ApplicationRecord
	has_many :cds, dependent: :destroy
	attachment :artist_image
end
