class SummaryController < ApplicationController


  #Basic Crud Actions
  def index
   @summary = Summary.all
   authorize @summary
 end

 def new
   @summary = Summary.new
   authorize @summary
 end

 def show
   @summary = Summary.find(params[:id])
   authorize @summary
 end

 def edit
   @summary = Summary.find(params[:id])
   authorize @summary
 end
 
 def create
   @summary = Summary.new(params.require(:Summary).permit(:name, :description, :public))
   authorize @summary
   if @summary.save
     redirect_to @summary, notice: "Summary was saved successfully."
   else
     flash[:error] = "Error creating Summary. Please try again."
     render :new
   end
 end
 
 def update
   @summary = Summary.find(params[:id])
   authorize @summary
   if @summary.update_attributes(params.require(:summary).permit(:description, :public))
     redirect_to @summary
   else
     flash[:error] = "Error saving Summary. Please try again."
     render :edit
   end
 end
end

