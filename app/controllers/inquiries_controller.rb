class InquiriesController < ApplicationController
  before_action :check_admin, only: [:index, :edit, :update, :destroy]

  def index
    @inquiries = Inquiry.all
    @users = User.all
      @inquiry= Inquiry.new
  end

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.user_id = current_user.id
    if @inquiry.save
      flash[:notice] = "登録しました"
      redirect_to inquiries_path
    else
      flash[:notice] = "Error!"
      render :new
    end
  end

  def show
    @inquiry=Inquiry.find(params[:id])

  end

  def edit
    @inquiry = Inquiry.find(params[:id])
  end

  def update
    @inquiry = Inquiry.find(params[:id])
    if @inquiry.update(inquiry_params)
        redirect_to inquiries_path
    else
      flash[:notice] = "Error!"
      render :edit
    end
  end

  def destroy
    @inquiry= Inquiry.find(params[:id])
    if @inquiry.destroy
      redirect_to inquiries_path
    end
  end

 private
  def inquiry_params
  	params.require(:inquiry).permit(:inquiry_email, :inquiry_category, :inquiry_body)
  end
end
