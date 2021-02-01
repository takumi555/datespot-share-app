class SearchController < ApplicationController 

  def index
    @posts = Post.search(params[:search])
    @tag_lists = Tag.all.limit(3)
  end
end