class PrefecturesController < ApplicationController

  def index
    @params = params[:prefecture]
    @posts = Post.where(prefecture: @params)

    @tag_lists = Tag.all.limit(3)
  end

  def show
   
  end
end