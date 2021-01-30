class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def index
    post = Post.find(params[:post_id])
    comments = post.comments
    render json: comments
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params.merge!(user_id: current_user.id))
    @comment.save!
    render json: @comment
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