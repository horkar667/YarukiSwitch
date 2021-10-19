class Admin::WordsController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    @words = Word.all
  end

  def show
    @word = Word.find(params[:id])
  end

  def destroy
    word = Word.find(params[:id])
    word.destroy
    redirect_to request.referrer || admin_root_path
  end

  def search
    @results = @q.result
  end
end
