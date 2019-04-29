class RootController < ApplicationController
	
	def top
		@categories = Category.all.reverse_order
		@pickups = Pickup.all.reverse_order
	end

	def about
	end
end
