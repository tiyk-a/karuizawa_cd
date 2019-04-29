class RootController < ApplicationController
	
	def top
		@categories = Category.last(15)
		@pickups = Pickup.last(5)
		@cds = Cd.last(3)
		@comments = Comment.last(3)
	end

	def about
	end
end
