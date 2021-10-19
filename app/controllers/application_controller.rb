class ApplicationController < ActionController::Base


  private

  def set_q
    @q = User.ransack(params[:q])
    @q = Word.ransack(params[:q])
  end
end
