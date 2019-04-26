class OrdersController < ApplicationController
	before_action :user_signed_in?
	
	def checkout
		@order = Order.new
		@user = current_user
	end

	def create
		@order = Order.new(order_params)
	end

	def confirmation
	end
end
