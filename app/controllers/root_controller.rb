class RootController < ApplicationController
	def top
		@categories = Category.all 
		@pickups = Pickup.all
		@cds = Cd.first(3)
		@comments = Comment.first(3)
	end

	def about
	end
end
