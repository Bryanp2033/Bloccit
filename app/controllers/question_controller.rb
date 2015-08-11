class QuestionController < ApplicationController
	def index
  	@question = Question.all
  end

  def show
  	@question = Question.find(params[:id])
  end

  def new
    @question = question.new
  end

  def create
    @question = question.new(params.require(:post).permit(:title, :body))
    if @question.save
      flash[:notice] = "Question was saved"
      redirect_to @question
    else
      flash[:error] = "There was an error saving the question. Please try again"
      render :new
    end
  end

  def edit
    @question = question.find(params[:id])
  end

  def update
    @question = question.find(params[:id])
   if @question.update_attributes(params.require(:post).permit(:title, :body))
       flash[:notice] = "question was updated."
       redirect_to @question
     else
       flash[:error] = "There was an error saving the question. Please try again."
       render :edit
     end
end
end