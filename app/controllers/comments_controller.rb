class CommentsController < ApplicationController
	def create
		@cd = Cd.find_by(params[:cd_id])
		@comment = @cd.comments.new(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to cd_path(@cd.id)
		else
			flash[:notice] = "Error!"
			redirect_to cd_path(@cd.id)
		end
	end

	def update
	end

	def destroy
		@cd = Cd.find_by(params[:cd_id])
		comment = Comment.find(params[:id])
		comment.destroy
		redirect_to cd_path(@cd)
	end

	private
  	def comment_params
  	params.require(:comment).permit(:comment_body, :user_id, :cd_id)
  	end
end
