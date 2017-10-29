class Favorite < ActiveRecord::Base

  #basic model relationships
  belongs_to :post
  belongs_to :user
  
end
