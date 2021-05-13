class SearchController < ApplicationController 

  def index
    @search = params[:search]
    @posts = Post.search(@search).order(created_at: :desc)
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(10)
    @tag_lists = Tag.all.limit(15)
  end
end