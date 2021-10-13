class Public::HomesController < ApplicationController

  def top
    if current_user && current_user.words.count >= 1
      @words = Word.where(user_id: current_user.id)
      @random = @words.sample
    else
      @words = Word.all
      @random = @words.sample
    end
  end

end
