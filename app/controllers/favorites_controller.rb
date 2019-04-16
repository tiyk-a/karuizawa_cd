class FavoritesController < ApplicationController
	def create
	end

	def destroy
	end

	private
  	def favorite_params
  	params.require(:favorite).permit()
  	end
end
