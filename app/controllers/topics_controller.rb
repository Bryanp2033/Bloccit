class TopicsController < ApplicationController

  #Basic Crud Actions

  # Shows a topics
  def index
  	@topics = Topic.all
  	authorize @topics
  end

  # Shows a selected Topic
  def show
  	@topic = Topic.find(params[:id])
  	authorize @topic
    @posts = @topic.posts.includes(:user).includes(:comments).paginate(page: params[:page], per_page: 10)
  end

  # Edits a topic
  def edit
  	@topic = Topic.find(params[:id])
  	authorize @topic
  end

  # Creates a topic action
  def new
    @topic = Topic.new
    authorize @topic
  end

  # Creates a new Topic
  def create
  	@topic = Topic.new(topic_params)
  	authorize @topic
  	if @topic.save
  		redirect_to @topic, notice: "Topic was saved successfully."
  	else
  		flash[:error] = "Error creating topic.Please try again."
  		render :new
  	end
  end

  # Updates a selected topic
  def update
   @topic = Topic.find(params[:id])
   authorize @topic
  # updates selected topic if it matches with the required params.
   if @topic.update_attributes(params.require(:topic).permit(:name, :description, :public))
     redirect_to @topic
   else
     flash[:error] = "Error saving topic. Please try again."
     render :edit
   end
 end

 # deletes a selected topic
 def destroy
  @topic = Topic.find(params[:id])
  authorize @topic
  if @topic.destroy
    flash[:notice] = "'#{@topic.name}' was deleted successfully"
    redirect_to topics_path
  else
    flash[:notice] = "Failed to delete topic"
    render :show
  end
end

private

def topic_params
  params.require(:topic).permit(:name, :description)
end
end
