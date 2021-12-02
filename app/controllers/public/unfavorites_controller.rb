class Public::UnfavoritesController < ApplicationController
  def create
    @unfavorite = current_user.unfavorites.create(word_id: params[:word_id])
  end

  def destroy
    @unfavorite = current_user.unfavorites.find_by(word_id: params[:word_id])
    @unfavorite.destroy
  end
end
