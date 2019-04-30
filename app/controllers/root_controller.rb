class RootController < ApplicationController
	
	def top
		@categories = Category.last(15)
		@pickups = Pickup.last(5)
		@cds = Cd.limit(3).order('id DESC')
		@comments = Comment.limit(3).order('id DESC')
	end

	def about
	end
end
