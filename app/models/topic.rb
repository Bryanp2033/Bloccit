class Topic < ActiveRecord::Base
	has_many :posts

	validates :title, length: {minimum: 5} prescence: true
	validates :user, prescence: true
end
