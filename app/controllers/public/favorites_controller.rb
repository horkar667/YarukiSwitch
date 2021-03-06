class Public::FavoritesController < ApplicationController
  def index
    @words = Word.includes(:favorite_users).sort { |a, b| b.favorite_users.size <=> a.favorite_users.size }
  end

  def create
    @favorite = current_user.favorites.create(word_id: params[:word_id])
    word = Word.find(params[:word_id])
    word.create_notification_like!(current_user)
  end

  def destroy
    @favorite = current_user.favorites.find_by(word_id: params[:word_id])
    @favorite.destroy
  end
end
