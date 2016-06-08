class PostsController < ApplicationController


#Basic Crud Actions
 def index
   @posts = Post.visible_to(current_user).where("posts.created_at > ?", 7.days.ago).paginate(page: params[:page], per_page: 10)
 end

 def show
   @post = Post.find(params[:id])
   @topic = Topic.find(params[:topic_id])
   @comment = Comment.new
   @comments = @post.comments
   authorize @post
 end

 def new
  @topic = Topic.find(params[:topic_id])
  @post = Post.new
  authorize @post
end

def create
  @topic = Topic.find(params[:topic_id])
  @post = Post.new(post_params)
  @post.user = current_user
  @post.topic = @topic
  authorize @post
  if @post.save_with_initial_vote
    flash[:notice] = "Post was saved"
    redirect_to [@topic, @post]
  else
    flash[:error] = "There was an error saving the post. Please try again"
    render :new
  end
end

def edit
  @post = Post.find(params[:id])
  @topic = Topic.find(params[:id])
  authorize @post
end

def destroy
  @topic = Topic.find(params[:topic_id])
  @post = Post.find(params[:topic_id])
  authorize @post

  if @post.destroy
    flash[:notice] = "Post was deleted successfully"
    redirect_to @topic
  else
    flash[:error] = "There was an error deleting the post, Please try again"
    render :show
  end
end

def update
  @topic = Topic.find(params[:topic_id])
  @post = Post.new(post.params)
  authorize @post
  if @post.update_attributes(params.require(:post).permit(:title, :body))
   flash[:notice] = "Post was updated."
   redirect_to [@topic, @post]
 else
   flash[:error] = "There was an error saving the post. Please try again."
   render :edit
 end
end



private

def post_params
  params.require(:post).permit(:title, :body)
end

end