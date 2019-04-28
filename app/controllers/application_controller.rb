class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
	protect_from_forgery with: :exception

	before_action :set_search
	helper_method :current_cart

	def after_sign_in_path_for(resource)
		cds_path
	end

	def after_sign_out_path_for(resource)
		cds_path
	end

	def set_search
		@search = Cd.ransack(params[:q])
		@search_cds = @search.result.includes(:artist)
	end


	def current_cart
		if session[:cart_id]
			@cart = Cart.find(session[:cart_id])
		else
			@cart = Cart.create
			session[:cart_id] = @cart.id
		end
# all visitors have one SESSION Cart

		if cart = Cart.find_by(user_id: current_user)
			@cart = Cart.find(session[:cart_id])
			if @cart === cart
			else
				if @cart.cart_items.present?
					@cart.cart_items.each do |i|
						if u_cart_i = cart.cart_items.find_by(cd_id: i.cd_id)
							u_cart_i.quantity += i.quantity
							u_cart_i.update
						else
							new_cart_i = cart.cart_items.new(cd_id: i.cd_id)
							new_cart_i.quantity = i.quantity
							new_cart_i.save
						end
					end
				else
				end
			end
		else
			if user_signed_in?
				@cart.user_id = current_user.id
				@cart.save
				cart = Cart.find_by(user_id: current_user)
			else
			end
		end

		if cart.present?
			return cart
		else
			return @cart
		end
	end


	def  check_admin
    #   ログイン済みかどうかの判断
     if current_user.admin != true
         redirect_to root_path
     end
   	end

protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :phone_number])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:user_name, :last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :phone_number])
        devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :phone_number])
    end

private
def search_params
	params.require(:q).permit(:cd_title_cont)
end

  def cart_params
  	params.require(:cart).permit(:user_id)
  end

end