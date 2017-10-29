class AdvertisementsController < ApplicationController
  # TODO future feature Topics
  
  def index
  	@ads = Advertisement.all
  end

  def show
  	@ad = Advertisement.find(params[:id])
  end

end
