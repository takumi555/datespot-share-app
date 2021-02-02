class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index

    if params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      @posts = @tag.posts
    else
      @posts = Post.all
    end
    @tag_lists = Tag.all.limit(15)
  end

  def show
    @post = Post.find(params[:id])
    @tag_list = @post.tags.pluck(:tag_name).join(',')
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    tag_list = params[:post][:tag_name].split(',')
    if  @post.save
        @post.save_posts(tag_list)
      redirect_to posts_path, notice: '投稿が完了しました'
    else
      flash.now[:error] = '投稿できませんでした'
      render :new
    end
    
  end

  def edit
    @post = Post.find(params[:id])
    @tag_list = @post.tags.pluck(:tag_name).join(',')
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:post][:tag_name].split(',')
    if @post.update(post_params)
      @post.save_posts(tag_list)
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