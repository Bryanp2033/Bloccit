class FavoritesController < ApplicationController
	 def create
     post = Post.find(params[:post_id])
     favorite = current_user.favorites.build(post: post)
 	 authorize favorite
     if favorite.save
       flash[:notice] = "favorite was succesful"
     else
       flash[:error] = "There was an error, Please try again!"
       redirect_to [post.topc, post]
     end
   end

   def destroy
   @post = Post.find(params[:post_id])
   favorite.user = current_user
   authorize favorite
 
   if favorite.destroy
     flash[:notice] = "favorite was deleted succesful"
     redirect_to [@post]
   else
     flash[:error] = "There was an error, Please try again!"
     redirect_to [@post]
   end
 end 
end
