class Topic < ActiveRecord::Base
	has_many :posts, dependent: :destroy
    validates :name, presence:true
    validates :description, presence:true

    self.per_page = 50
end
