class Public::HomesController < ApplicationController

  def top
    if current_user
      case current_user.action
      when "r1"
        @words = Word.all
        @random = @words.sample
      when "r2"
        @words = Word.where(user_id: current_user)
        @random = @words.sample
      when "r3"
        @words = Word.find(Favorite.where(user_id: current_user).pluck(:word_id))
        @random = @words.sample
      when "r4"
        favorites = Favorite.where(user_id: current_user).pluck(:word_id)
        favorite_words = Word.find(favorites)
        @words = Word.where(user_id: current_user)
        @random = (favorite_words + @words).sample
      end
    else
      @words = Word.all
      @random = @words.sample
    end
  end

end
