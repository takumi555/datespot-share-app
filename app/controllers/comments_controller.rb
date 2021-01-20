class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def new
    post = Post.find(params[:post_id])
    @comment = post.comments.build

  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params.merge!(user_id: current_user.id))
    if @comment.save!
      redirect_to post_path(@post), notice: 'コメントできました'
    else
      flash.now[:error] = 'コメントできませんでした'
      render :new
    end

  end

  def destroy

    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy!
    redirect_to post_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end


end