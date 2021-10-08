class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @word = Word.new
    @words = Word.where(user_id: params[:id])
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

  private

  def user_params
    params.require(:user).permit(:nickname, :image, :introduction)
  end
end
