class UsersController < ApplicationController

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

   private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end

end