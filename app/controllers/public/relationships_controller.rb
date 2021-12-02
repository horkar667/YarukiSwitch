class Public::RelationshipsController < ApplicationController
  def create
    following = current_user.relationships.build(follower_id: params[:user_id])
    following.save
    @user = User.find_by(id: params[:user_id])
    @user.create_notification_follow!(current_user)
  end

  def destroy
    following = current_user.relationships.find_by(follower_id: params[:user_id])
    following.destroy
    @user = User.find_by(id: params[:user_id])
  end
end
