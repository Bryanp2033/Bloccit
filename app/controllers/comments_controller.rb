class CommentsController < ApplicationController
	def create
		@topic = Topic.find(params[:topic_id])
		@post = Posts.find(params[:post_id])
		comments = @post.comments.new(comments_params)
		@comment.user_id = current_user.id 
		if @comment.save
			redirect_to [@topic, @post], notice: "Comment saved successfully"
		else
			redirect_to [@topic, @post], notice: "Coment failed to save"
		end
	end

def destroy
	@topic = Topic.find(params[:topic_id])
	@post= Posts.find(params[:post_id])
	@comment = @post.comments.find(params[:id])

	authorize @comment
	if @comment.destroy
		flash[:notice] = "Comment was removed"
	else
		flash[:error]= "There was trouble deleting that comment, Please try again"
		redirect_to [@topic, @post]
	end
end
	private

	def comments_params
		params.require(:comment).permit(:body)
	end
end
