class Post < ActiveRecord::Base

  #basic model realtionships
	has_many :comments, dependent: :destroy
	belongs_to :user
	belongs_to :topic
	has_many :votes, dependent: :destroy
 has_many :favorites, dependent: :destroy
 has_one :summary

#arranges the collection of posts in descending order
 default_scope {order('created_at DESC')}

 #visible to only users, so that means no guests are allowed to view
 scope :visible_to, -> (user) { user ? all : joins(:topic).where('topics.public' => true) }

 #also aranged based on titles
 scope :order_by_title, -> { order('title') }
 scope :order_by_reverse_created, -> { order('created_at DESC') }


 #basic validations
 validates :title, length: { minimum: 5 }, presence: true
 validates :body, length: { minimum: 20 }, presence: true
 validates :topic, presence: true
 validates :user, presence: true
#after_save :create_vote (pry code)


  #keeps track of the post's up_votes, down_votes, and total sum of votes
   def up_votes
   	votes.where(value: 1).count
   end

   def down_votes
   	votes.where(value: -1).count
   end

   def points
     votes.sum(:value)
   end

   #this is for the time method for figuring out how long the post was created
   def update_rank
    age = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
    new_rank = points + age

    update_attribute(:rank, new_rank)
  end

  def save_with_initial_vote
    return false unless save
    user.votes.create(value: 1, post: self)
  end

  private

  def create_vote
   user.votes.create(value: 1, post: self)
 end
end

