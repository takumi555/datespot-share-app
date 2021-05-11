class FollowsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
  def create
    @user = User.find(params[:account_id])
    current_user.follow!(@user)
    redirect_to account_path(params[:account_id])
    @user.create_notification_follow!(current_user)
  end
end