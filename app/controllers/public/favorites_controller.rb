class Public::FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(word_id: params[:word_id])
  end


  def destroy
    @favorite = current_user.favorites.find_by(word_id: params[:word_id])
    @favorite.destroy
  end
end
