class Topic < ActiveRecord::Base
	has_many :posts, dependent: :destroy
    validates :name, presence:true
    validates :description, presence:true


scope :public, -> { where(:public => true)}
scope :private, -> { where(:public => false)}
scope :visible_to, -> (user) {user ? all : public}

end
