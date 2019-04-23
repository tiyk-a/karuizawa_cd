class ApplicationController < ActionController::Base
    
   def  check_admin
    #   ログイン済みかどうかの判断
    
     if current_user.id != 1
         redirect_to root_path
     end
   end
  
   def after_sign_in_path_for(resource)
     root_path(current_user)
   end
   
   def after_sign_up_path_for(resource)
     "/users/#{current_user.id}"
   end
   
   def after_sign_out_path_for(resource)
     root_path # ログアウト後に遷移するpathを設定
   end
   
   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name,:first_name,:last_name,:first_name_kana,:last_name_kana,:post_code,:phone_number,:password])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username,:password])
   end
end
