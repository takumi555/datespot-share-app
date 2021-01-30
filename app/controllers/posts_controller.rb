class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]


  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: '投稿が完了しました'
    else
      flash.now[:error] = '投稿できませんでした'
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: '更新が完了しました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    redirect_to posts_path, notice: '削除しました'
  end

  private
  def post_params
    params.require(:post).permit(:title, :prefecture, :area, :content, :url, images: [])
  end

end