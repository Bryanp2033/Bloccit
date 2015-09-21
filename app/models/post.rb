class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	belongs_to :user
	belongs_to :topic
	has_many :votes, dependent: :destroy
   has_many :favorites, dependent: :destroy
   has_one :summary

default_scope {order('created_at DESC')}
 scope :visible_to, -> (user) { user ? all : joins(:topic).where('topics.public' => true) }
scope :order_by_title, -> { order('title') }
scope :order_by_reverse_created, -> { order('created_at DESC') }

validates :title, length: { minimum: 5 }, presence: true
   validates :body, length: { minimum: 20 }, presence: true
   validates :topic, presence: true
   validates :user, presence: true

   after_save :create_vote 

   def up_votes
   	votes.where(value: 1).count
   end

   def down_votes
   	votes.where(value: -1).count
   end

   	def points
   		votes.sum(:value)
   	end

   	def update_rank
    age = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
    new_rank = points + age

    update_attribute(:rank, new_rank)
   	end

    def save_with_inital_vote
      ActiveRecord::Base.transaction do 
        @post = self
        user.votes.create(value: 1, post: @post)
      end
        
      end

    private

   	def create_vote
   		user.votes.create(value: 1, post: self)
   	end
   end

	 