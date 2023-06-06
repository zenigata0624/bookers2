class UsersController < ApplicationController

   before_action :correct_user,only: [:edit,:update]

   before_action :set_user, only: [:followings,:followers]

  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
  end

  def edit
    @user= current_user
  end

  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
    redirect_to user_path(@user.id),success: "user was successfully update."
    else
     render:edit
    end
  end

  def followings
   @users = @user.followings
  end

  def followers
     @users = @user.followers
  end

   private


  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end

  def correct_user
   @user=User.find(params[:id])
   redirect_to user_path(current_user) unless @user==current_user
  end



end