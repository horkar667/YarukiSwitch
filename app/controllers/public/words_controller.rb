class Public::WordsController < ApplicationController

  def index
  end

  def show
  end

  def edit
  end

  def update
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
