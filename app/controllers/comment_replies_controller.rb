class CommentRepliesController < ApplicationController
	def create
		comment = Comment.find(params[:comment_id])
		comment_reply = comment.comment_replies.new(comment_reply_params)
		if comment_reply.save
			redirect_to cd_path(comment.cd)
		else
			flash[:notice] = "Reply error!"
			redirect_to cd_path(comment.cd)
		end
	end

	def update
	end

	def destroy
		comment_reply = CommentReply.find(params[:id])
		comment_reply.destroy
		cd = Cd.find(comment_reply.comment.cd_id)
		redirect_to cd_path(cd)
	end

	private
  	def comment_reply_params
  	params.require(:comment_reply).permit(:comment_reply_body, :user_id, :comment_id, :cd_id)
  	end
  end
