class RootController < ApplicationController
	def top
		@categories = Category.first(15)
		@pickups = Pickup.first(5)
		@cds = Cd.first(3)
		@comments = Comment.first(3)
	end

	def about
	end
end
