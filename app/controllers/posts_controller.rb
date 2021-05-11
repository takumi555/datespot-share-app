class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy ]
  before_action :baria_user, only: [:edit, :destroy]

  def index
    if params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      @posts = @tag.posts.order(created_at: :desc).page(params[:page]).per(10)
    else
      @posts = Post.all.order(created_at: :desc).page(params[:page]).per(10)
    end
    @tag_lists = Tag.all.limit(15)

  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = Comment.new
    @comments = @post.comments.page(params[:page]).per(10)
    
    @tag_list = @post.tags.pluck(:tag_name).join(',')
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    tag_list = params[:post][:tag_name].gsub(/[[:space:]]/, '').split(',')
    if  @post.save
        @post.save_posts(tag_list)
      redirect_to posts_path, notice: '投稿が完了しました！'
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
    tag_list = params[:post][:tag_name].gsub(/[[:space:]]/, '').split(',')
    if @post.update(post_params)
      @post.save_posts(tag_list)
      redirect_to posts_path, notice: '更新が完了しました！'
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

  def baria_user 
    unless Post.find(params[:id]).user_id == current_user.id
      flash[:notice] = "権限がありません"
      redirect_to root_path
    end
  end

end