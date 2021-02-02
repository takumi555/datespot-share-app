class SearchController < ApplicationController 

  def index
    @posts = Post.search(params[:search])
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(5)
    @tag_lists = Tag.all.limit(3)
  end
end