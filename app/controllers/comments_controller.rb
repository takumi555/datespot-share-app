class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment_post = @comment.post
    if @comment.save!
      @comment_post.create_notification_comment!(current_user, @comment.id)
      render :index
    end
  end

  def destroy

    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy!
    render :index
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end


end