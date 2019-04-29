class CartsController < ApplicationController
  before_action :current_cart

  def check
    @cart = current_cart
  end

  def update
  	@cart = Cart.find(params[:id])
  	@cart.update(cart_params)
  	redirect_to check_path
  end

  private
  def cart_params
  	params.require(:cart).permit(:user_id)
  end

end