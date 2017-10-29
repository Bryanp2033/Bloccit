class Comment < ActiveRecord::Base

  #basic model relationships and validations
  belongs_to :post
  belongs_to :user

  validates :body, length: { minimum: 5 }
  validates :body, presence: true
  validates :user_id, presence: true

  #arranges the order of comments in descending order
  default_scope { order('updated_at DESC')}

  #calls this private method after creation
  after_create :send_favorite_emails

  private

  def send_favorite_emails
   post.favorites.each do |favorite|
    if user_id != favorite.user_id && favorite.user.email_favorites?
      it should_receive_update_for?(favorite)
      FavoriteMailer.new_comment(favorite.user, post, self).deliver_now
    end
  end
end

def should_receive_update_for?(favorite)
  user_id != favorite.user_id && favorite.user.email_favorites?
end
end