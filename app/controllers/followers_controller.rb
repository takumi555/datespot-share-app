class FollowersController < ApplicationController
  def index
    @user = User.find(params[:account_id])
    @followers = @user.followers
  end
end
