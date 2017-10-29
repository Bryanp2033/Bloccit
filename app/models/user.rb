class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #this is for the devise
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable


  #basic model relationships. destroy means that if those were to be deleted,
  # it would counted as a separate deletion apart from the said relationship.

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #for image uploading for user profiles
  mount_uploader :avatar, AvatarUploader


  #user roles within the app
  def admin?
      role == 'admin'
  end

  def moderator?
      role == 'moderator'
  end

  #checks the total fovorited posts it's attached to the user
  def favorited(post)
      favorites.where(post_id: post.id).first
  end

 #checks the total voted posts it's attached to the user
  def voted(post)
      votes.where(post_id: post.id).first
  end

  #This is for the popular users section
  def self.top_rated
         self.select('users.*') # Select all attributes of the user
         .select('COUNT(DISTINCT comments.id) AS comments_count') # Count the comments made by the user
         .select('COUNT(DISTINCT posts.id) AS posts_count') # Count the posts made by the user
         .select('COUNT(DISTINCT comments.id) + COUNT(DISTINCT posts.id) AS rank') # Add the comment count to the post count and label the sum as "rank"
         .joins(:posts) # Ties the posts table to the users table, via the user_id
         .joins(:comments) # Ties the comments table to the users table, via the user_id
         .group('users.id') # Instructs the database to group the results so that each user will be returned in a distinct row
         .order('rank DESC') # Instructs the database to order the results in descending order, by the rank that we created in this query. (rank = comment count + post count)
     end
 end

