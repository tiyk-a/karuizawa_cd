class CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new(cart_item_params)
    if user_signed_in?
      @cart_item.user_id = current_user
    else
      @cart_item.user_id = 0
    end
    if @cart_item.save
      redirect_to cd_path
    else
      render :show
    end
  end

  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.update_attributes(cart_item_params)
    @cart_items = @cart.cart_items
  end

  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy
    @cart_items = @cart.cart_items
  end
private
  def cart_item_params
    params.require(:cart_item).permit(:quantity, :cd_id, :user_id, :cart_id)
  end
end