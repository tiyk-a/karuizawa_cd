class CartItemsController < ApplicationController
  # before_action :authenticate_user!
  # before_action :current_cart
  
  def create
    if
      CartItem.where(cart_id: current_cart, cd_id: params[:cd_id]).exists?
      item = CartItem.where(cart_id: current_cart, cd_id: params[:cd_id]).last
      item.quantity += params[:quantity]
      item.update
      redirect_to check_path
    else
      @cart_item = CartItem.new(cart_item_params)
      if @cart_item.save
        redirect_to check_path
      else
        flash[:notice] = "Error!"
        redirect_to check_path
      end
    end
  end

  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.update_attributes(cart_item_params)
    @cart_items = @cart.cart_items
    redirect_to check_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to check_path
  end
private
  def cart_item_params
    params.require(:cart_item).permit(:quantity, :cd_id, :cart_id)
  end
end