class Public::HomesController < ApplicationController

  def top
    if current_user && current_user.words.count >= 1
      favorites = Favorite.where(user_id: current_user).pluck(:word_id)
      favorite_words = Word.find(favorites)
      @words = Word.where(user_id: current_user)
      @random = (favorite_words + @words).sample
    else
      @words = Word.all
      @random = @words.sample
    end
  end

end
