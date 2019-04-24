class InquiriesController < ApplicationController
  def index
    @inquiries = inquiry.all
    @users = user.all
  end

  def new
    @inquiry= Inquiry.new
  end
  
  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      flash[:notice] = "登録しました"
      redirect_to root_path
    else
      flash[:notice] = "Error!"
      render :new
    end
    	@cd = Cd.find_by(params[:cd_id])
		@comment = @cd.comments.new(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to cd_path(@cd.id)
		else
			flash[:notice] = "Error!"
			redirect_to cd_path(@cd.id)
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
