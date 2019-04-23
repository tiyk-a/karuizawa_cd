class InquiriesController < ApplicationController
  def index
  end

  def new
    @inquiry= Inquiry.new
  end
  
  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      flash[:notice] = "登録しました"
      redirect_to artist_path(@inquiry.id)
    else
      flash[:notice] = "Error!"
      render :new
    end
  end

  def show
  end

  def edit
  end
  
 private
  def inquiry_params
  	params.require(:inquiry).permit(:inquiry_Email, :inquiry_category, :inquiry_body)
  end
end
