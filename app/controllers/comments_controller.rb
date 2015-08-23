class CommentsController < ApplicationController
	def create
		
		@post = Posts.find(params[:post_id])
		comments = current_user.comment.new(comments_params)
		@comment.post = @post
		authorize @comment

		if @comment.save
			flash[:notice] "Comment saved successfully"
		else
			flash[:error] = "Comment failed to save."
		end
	end
respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post] }
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

    respond_with(@comment) do |format|
      format.html{ redirect_to [@post.topic, @post] }
    end
  end

	private

	def comments_params
		params.require(:comment).permit(:body)
	end
end
