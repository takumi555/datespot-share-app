class PopularsController < ApplicationController 

  def index
    @posts = Post.left_outer_joins(:likes).group('posts.id').select('posts.*, COUNT(likes.*) AS likes_count').distinct.reorder(likes_count: :desc).limit(100)
  end
end