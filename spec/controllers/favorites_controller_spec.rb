require 'rails_helper'

# Favorites Controller Test
describe FavoritesController do

  include Devise::TestHelpers

  before do 
    @user = User.create!(email: 'email@example.com', password: 'a password')
    @post = Post.create!(user: @user, topic: Topic.create!, body: 'a test body that is quite long', title: 'a test title')

    sign_in @user
  end


  describe '#sign_in' do
    it 'sign_in the user' do
      expect( @user.current_path).to eq (true)
    end
  end

  describe '#create' do
    it "creates a favorite for the current user and specified post" do
      expect( @user.favorites.find_by(post_id: @post.id) ).to be_nil

      post :create, { post_id: @post.id }

      expect( @user.favorites.find_by(post_id: @post.id) ).not_to be_nil
    end
  end

  describe '#destroy' do
    it "destroys the favorite for the current user and post" do
      favorite = @user.favorites.where(post: @post).create
      expect( @user.favorites.find_by(post_id: @post.id) ).not_to be_nil

      delete :destroy, { post_id: @post.id, id: favorite.id }

      expect( @user.favorites.find_by(post_id: @post.id) ).to be_nil
    end
  end
end

