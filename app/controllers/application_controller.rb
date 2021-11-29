class ApplicationController < ActionController::Base

  def set_q
    @q = Word.ransack(params[:q])
  end

  def ensure_current_user
    if current_user.id != params[:id].to_i
      redirect_to user_path(current_user.id)
    end
  end

  def require_login
    unless current_user
      redirect_to new_user_session_path, notice: 'Please sign in to get started!'
    end
  end
end
