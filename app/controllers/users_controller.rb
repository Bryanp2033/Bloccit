class UsersController < ApplicationController
 before_action :authenticate_user!, except: [:show]
 
 #Basic Crud Actions
 def show
  @user = User.find(params[:id])
  @posts = @user.posts.visible_to(current_user)
  @comments = @user.comments
end

def update
  if current_user.update_attributes(user_params)
    flash[:notice] = "User information updated"
    redirect_to edit_user_registration_path
  else
    flash[:error] = "Invalid user information"
    redirect_to edit_user_registration_path
  end
end


#shows an index of users with the top_rated method and pagination feature
def index
  @users = User.top_rated.paginate(page: params[:page], per_page: 10)
end

private

def user_params
 params.require(:user).permit(:name, :avatar, :email_favorites)
end
end
