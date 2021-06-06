class FollowingsController < ApplicationController
  def index
    @user = User.find(params[:account_id])
    @followings = @user.followings
  end
end
