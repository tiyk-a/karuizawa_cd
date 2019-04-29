class RootController < ApplicationController
	
	def top
		@categories = Category.all.reverse_order
		@pickups = Pickup.all.reverse_order
		@cds = Cd.limit(3).reverse_order
	end

	def about
	end
end
