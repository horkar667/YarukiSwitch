class Public::WordsController < ApplicationController
  before_action :require_login, only: [:show]
  before_action :set_q, only: [:index, :search]

  def index
    @words = Word.all.page(params[:page]).per(30)
  end

  def show
    @word = Word.find(params[:id])
    @comments = WordComment.where(word_id: @word).page(params[:page]).per(30)
    @user = @word.user
    @comment = WordComment.new
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

  def search
    @results = @q.result.page(params[:page]).per(30)
  end

      private

  def word_params
    params.require(:word).permit(:word)
  end
end
