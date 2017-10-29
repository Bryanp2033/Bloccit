class CommentsController < ApplicationController

	#Basic Crud Actions

	# Finds a Post, the comment in its post
	# and its's user assoicated with that comment
	def create

		@post = Post.find(params[:post_id])
		@comments = @post.comments
		@comment = Comment.new(comments_params)
		@comment.user = current_user
		@comment.post = @post
		@new_comment = Comment.new
		
		#policy action
		authorize @comment


		#comment saving to the db(database)
		if @comment.save
			flash[:notice] = "Comment saved successfully"
		else
			flash[:error] = "Comment failed to save."
		end

		# this if for ajax post 
		respond_to do |format|
			format.html
			format.js
		end
	end
	
	# finds a post and then deletes the comment
	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		authorize @comment

		if @comment.destroy
			flash[:notice] = "Comment was removed."
		else
			flash[:error] = "Comment couldn't be deleted. Try again."
		end

		#this is for ajax destroy
		respond_to do |format|
			format.html
			format.js
			
		end
	end

	private

	def comments_params
		params.require(:comment).permit(:body)
	end
end
