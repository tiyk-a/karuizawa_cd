class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, only: [:index]
 
  def index
    @users = User.all
  end
  
 

  def show
   @user= find(params[:id])
  end
  
   def new
      @user= User.new
   end
  
   def create
    
      @user= User.new(user_params)
      if @user.save
        redirect_to new_user_session_path, notice:'登録完了しました'
      else
        render 'users/registrations/new'
      end
   end
 
   private
  def user_params
    params.require(:user).permit(:user_name,:first_name,:last_name,:first_name_kana,:last_name_kana,:post_code,:phone_number,:password )
  end

end


  