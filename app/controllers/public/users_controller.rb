class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @word = Word.new
    @words = Word.where(user_id: params[:id])
  end

  def edit
  end

  def update
  end

  def withdraw
  end
end
