class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_q, only: [:index, :search]

  def index
    @users = @q.result
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
    @results = @q.result
  end

  def set_q
    @q = User.ransack(params[:q])
  end
   private

 	def user_params
 	  params.require(:user).permit(:is_deleted)
 	end
end
