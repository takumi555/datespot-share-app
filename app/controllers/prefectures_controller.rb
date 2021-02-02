class PrefecturesController < ApplicationController

  def index
    @params = params[:prefecture]
    @posts = Post.where(prefecture: @params)
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(5)

    @tag_lists = Tag.all.limit(3)
    
  end

end