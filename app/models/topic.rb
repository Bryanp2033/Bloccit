class Topic < ActiveRecord::Base
	has_many :posts, dependent: :destroy
    validates :name, presence:true
    validates :description, presence:true


scope :publicly_available, -> { where(:public => true)}
scope :privately_avaiable, -> { where(:public => false)}
scope :visible_to, -> (user) {user ? all : public}

end
