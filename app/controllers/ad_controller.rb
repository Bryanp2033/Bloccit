class AdController < ApplicationController
  def index
  	@ad = Adevertisment.all
  end

  def show
  	@ad = Adevertisment.find(params[:id])
  end
end
