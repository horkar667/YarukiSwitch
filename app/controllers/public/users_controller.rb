class Public::UsersController < ApplicationController
  before_action :require_login
  before_action :ensure_current_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @word = Word.new
    @words = Word.where(user_id: params[:id]).page(params[:page]).per(20)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(current_user)
    flash[:notice]="You have updated user successfully."
  end

  def withdraw
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.followings.page(params[:page]).per(30)
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(30)
  end

  def favorites
    @favorites = Favorite.where(user_id: params[:user_id]).pluck(:word_id)
    @words = Word.find(@favorites)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :image, :introduction)
  end
end
