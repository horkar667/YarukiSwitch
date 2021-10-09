class Public::WordsController < ApplicationController

  def index
    @words = Word.all
  end

  def show
    @word = Word.find(params[:id])
    @user = @word.user
  end

  def create
    @word = Word.new(word_params)
    @word.user_id = current_user.id
    @word.save
    redirect_to user_path(current_user)
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    redirect_to user_path(current_user)
  end

      private

  def word_params
    params.require(:word).permit(:word)
  end
end
