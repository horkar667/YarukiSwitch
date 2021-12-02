class Admin::WordsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_q, only: [:index, :search]

  def index
    @words = Kaminari.paginate_array(Word.includes(:unfavorite_users).sort { |a, b| b.unfavorite_users.size <=> a.unfavorite_users.size }).page(params[:page]).per(30)
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
    @results = @q.result.page(params[:page]).per(30)
  end
end
