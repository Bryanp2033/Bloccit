class SummariesController < ApplicationController

def index
     @summary = Summary.all
   
   end

   def new
     @summary = Summary.new
     @summary.post = Post.find(params[:post_id])
   end

   def show
     @summary = Summary.find(params[:id])
     
   end

   def edit
     @summary = Summary.find(params[:id])
     
   end
 
   def create
     @summary = Summary.new(params.require(:summary).permit(:body))
     @summary.post = Post.find(params[:post_id])
     
     if @summary.save
       redirect_to [@summary.post.topic, @summary.post], notice: "Summary was saved successfully."
     else
       flash[:error] = "Error creating Summary. Please try again."
       render :new
     end
   end
 
   def update
     @summary = Summary.find(params[:id])
     
     if @summary.update_attributes(params.require(:summary).permit(:description, :public))
       redirect_to post_summary_path
     else
       flash[:error] = "Error saving Summary. Please try again."
       render :edit
     end
   end
 end

