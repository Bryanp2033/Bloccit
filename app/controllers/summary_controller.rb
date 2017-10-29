class SummaryController < ApplicationController


  #Basic Crud Actions

  # Shows all summaries
  def index
   @summary = Summary.all
   authorize @summary
 end

 # Creates a new summary action
 def new
   @summary = Summary.new
   authorize @summary
 end

 # Creates a selected summary
 def show
   @summary = Summary.find(params[:id])
   authorize @summary
 end

 # Edits a selected summary
 def edit
   @summary = Summary.find(params[:id])
   authorize @summary
 end
 
 # Creates a new summary
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
 
 # Updates a selected summary
 def update
   @summary = Summary.find(params[:id])
   authorize @summary

   # if a summary updates also match the perimited requirements
   if @summary.update_attributes(params.require(:summary).permit(:description, :public))
     redirect_to @summary
   else
   # else flash an error message
     flash[:error] = "Error saving Summary. Please try again."
     render :edit
   end
 end
end

