class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  
  def index
    @posts = current_user.favorite_posts
    @tag_lists = Tag.all.limit(15)
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(10)
  end
end