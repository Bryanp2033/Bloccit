class Post < ActiveRecord::Base
	has_many :comments
	belongs_to :user
	belongs_to :topic


default_scope {order('created_at DESC')}
scope :order_by_title, -> { order('title') }
scope :order_by_reverse_created, -> { order('created_at DESC') }
end
	 