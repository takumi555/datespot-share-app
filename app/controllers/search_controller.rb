class SearchController < ApplicationController 

  def index
    @posts = Post.search(params[:search])
  end
end