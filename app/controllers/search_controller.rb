class SearchController < ApplicationController 

  def index
    @search = params[:search]
    @posts = Post.search(@search)
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(5)
    @tag_lists = Tag.all.limit(3)
  end
end