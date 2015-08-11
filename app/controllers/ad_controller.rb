class AdController < ApplicationController
  def index
  	@ad = Advertisement.all
  end

  def show
  	@ad = Advertisement.find(params[:id])
  end
end
