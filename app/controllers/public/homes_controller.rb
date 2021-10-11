class Public::HomesController < ApplicationController

  def top
    if current_user
      @words = Word.where(user_id: current_user.id)
      @random = @words.sample
    else
      @words = Word.all
      @random = @words.sample
    end
  end

end
