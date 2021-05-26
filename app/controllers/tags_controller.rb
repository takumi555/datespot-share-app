class TagsController < ApplicationController 

  def index
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts.order(created_at: :desc).page(params[:page]).per(10)
    @tag_lists = Tag.all.limit(20)
  end
  
end