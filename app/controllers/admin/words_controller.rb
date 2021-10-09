class Admin::WordsController < ApplicationController

  def index
    @words = Word.all
  end

  def show
  end

  def destroy
    word = Word.find(params[:id])
    word.destroy
    redirect_to request.referrer || admin_root_path
  end
end
