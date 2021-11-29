class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_q, only: [:index, :search]

  def index
    @users = @q.result.page(params[:page]).per(30)
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to request.referrer || admin_root_path
  end

  def search
    @results = @q.result.page(params[:page]).per(30)
  end

   private

  def set_q
    @q = User.ransack(params[:q])
  end

 	def user_params
 	  params.require(:user).permit(:is_deleted)
 	end
end
