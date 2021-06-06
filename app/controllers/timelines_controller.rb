class TimelinesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    user_ids = current_user.followings.pluck(:id)
    @posts = Post.where(user_id: user_ids).order(created_at: :desc)

    @tag_lists = Tag.all.limit(15)

    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(10)
  end
end
