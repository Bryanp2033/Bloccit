class SummaryController < ApplicationController

def index
     @summary = Summary.all
   
   end

   def new
     @summary = Summary.new
    
   end

   def show
     @summary = Summary.find(params[:id])
     
   end

   def edit
     @summary = Summary.find(params[:id])
     
   end
 
   def create
     @summary = Summary.new(params.require(:Summary).permit(:name, :description, :public))
     
     if @summary.save
       redirect_to @summary, notice: "Summary was saved successfully."
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

