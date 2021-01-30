class FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @posts = current_user.favorite_posts
  end
end