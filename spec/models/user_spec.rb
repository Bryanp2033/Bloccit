require 'rails_helper'

describe User do 
	include TestFactories

	describe ".top_rated" do
 
     before do
       @user1 = create(:user_with_post_and_comment)
      
 
       @user2 = create(:user)
       post = create(:post, user: @user2)
       2.times { create(:comment, user: @user2, post: post) }
     end
 
     it "returns users ordered by comments + posts" do
       expect( User.top_rated ).to eq([@user2, @user1])
     end
 
     it "stores a `posts_count` on user" do
       users = User.top_rated
       expect( users.first.posts_count ).to eq(1)
     end
 
     it "stores a `comments_count` on user" do
       users = User.top_rated
       expect( users.first.comments_count ).to eq(2)
     end
   end

	describe "#favorited(post)" do
		it "returns 'nil' if the user has not favorited the post" do
			user = User.create email: 'mine@example.com', password: '12345678' # create a user
			topic = Topic.create name: 'example', description: 'This is a topic for this spec test'
			post = Post.create title: 'This is a title for this', body:'This is a body for the title of this post for this test' # create a post

		    favorite = user.favorited(post) # call favorited on the user with that post in parameters
			
			# expect the result to be nil
			expect(favorite).to eq(nil)
		end

		it "returns the appropriate favorite if it exists" do
			user = User.create email: 'mine@example.com', password: '12345678' # create a user
			topic = Topic.create name: 'example', description: 'This is a topic for this spec test'
			post = Post.create title: 'This is a title for this', body:'This is a body for the title of this post for this test' # create a post
			favorite = Favorite.create user: user# create a favorite for the user for that post

			favorited = user.favorited(post)# call favorited on the user with that post in parameters

			expect(favorited).to eq(favorite) # expect the result to be the favorite
		end
	end
end
