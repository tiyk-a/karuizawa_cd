class CommentRepliesController < ApplicationController
	def create
	end

	def update
	end

	def destroy
	end

	private
  	def comment_reply_params
  	params.require(:comment_reply).permit()
  	end
  end
