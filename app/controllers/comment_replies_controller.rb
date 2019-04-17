class CommentRepliesController < ApplicationController
	def create
	end

	def update
	end

	def destroy
	end

	private
  	def comment_reply_params
  	params.require(:comment_reply).permit(:comment_reply_body, :user_id, :comment_id)
  	end
  end
