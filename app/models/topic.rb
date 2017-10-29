class Topic < ActiveRecord::Base

	#basic model relationships and validations
	has_many :posts, dependent: :destroy
    validates :name, presence:true
    validates :description, presence:true
    
end
