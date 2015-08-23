class Topic < ActiveRecord::Base
	has_many :posts, dependent: :destroy

	validates :title, length: {minimum: 5} prescence: true
	validates :user, prescence: true
end
