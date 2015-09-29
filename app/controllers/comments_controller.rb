class CommentsController < ApplicationController
	def create
		
		@post = Post.find(params[:post_id])

		@comment = current_user.comments.build(comments_params)
		@comment.post = @post
		@new_comment = Comment.new
		authorize @comment

		if @comment.save
			flash[:notice] = "Comment saved successfully"
		else
			flash[:error] = "Comment failed to save."
		end

	  
	end
	

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize @comment

    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
    end
    
  end

	private

	def comments_params
		params.require(:comment).permit(:body)
	end
end
