class Public::HomesController < ApplicationController

  def top
    @word = Word.where(user_id: current_user.id)
    @random = @word.sample
  end

end
