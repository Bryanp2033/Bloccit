class CommentsController < ApplicationController
	def create
		@topic = Topic.find(params[:topic_id])
		@post = @topic.posts.find(params[:post_id])
		comments = @post.comments.new(comments_params)
		@comment.user_id = current_user.id 
		if @comment.save
			redirect_to [@topic, @post], notice: "Comment saved successfully"
		else
			redirect_to [@topic, @post], notice: "Coment failed to save"
		end
	end

	private

	def comments_params
		params.require(:comment).permit(:body)
	end
end
