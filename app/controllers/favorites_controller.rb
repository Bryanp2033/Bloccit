class FavoritesController < ApplicationController

  #
  def create
   post = Post.find(params[:post_id])
   favorite = current_user.favorites.build(post: post)

   #policy for favoriting
   authorize favorite
   if favorite.save
     flash[:notice] = "post was favorited was succesfully"
     redirect_to [post.topic, post]
   else
     flash[:error] = "There was an error, Please try again!"
     redirect_to [post.topic, post]
   end
 end

 #
 def destroy
   @post = Post.find(params[:post_id])
   favorite = current_user.favorites.find(params[:id])
   authorize favorite

   if favorite.destroy
     flash[:notice] = "post was unfavorited succesfully"
     redirect_to [@post.topic, @post]
   else
     flash[:error] = "There was an error, Please try again!"
     redirect_to [@post.topic, @post]
   end
 end 
end
