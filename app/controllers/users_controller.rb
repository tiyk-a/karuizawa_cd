class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, only: [:index, :destroy_admin, :add_admin]

  def index
    @users = User.all.reverse_order
  end


  def show
   @user= current_user
  end


   def create
      @user= User.new(user_params)
      if @user.save
        redirect_to new_user_session_path, notice:'登録完了しました'
      else
        render 'users/registrations/new'
      end
   end

   def edit
       @user =current_user
   end

   def update
       @user=User.find(params[:id])
        if @user.update(user_params)
          flash[:notice] = "更新しました!"
          redirect_to root_path
        else
          flash[:notice] = "Error!"
          render :edit
        end
   end
 
 def destroy
     @user= User.find(params[:id])
     @user.destroy
     redirect_to users_path
 end

 def add_admin
    @user = User.find(params[:id])
    @user.update_column(:admin, true)
    redirect_to users_path
 end

 def destroy_admin
    @user = User.find(params[:id])
    @user.update_column(:admin, false)
    redirect_to users_path
 end

   private
  def user_params
    params.require(:user).permit(:email, :user_name,:first_name,:last_name,:first_name_kana,:last_name_kana,:post_code,:phone_number,:password, :admin)
  end

end