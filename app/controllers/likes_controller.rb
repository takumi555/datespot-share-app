class LikesController < ApplicationController
  before_action :authenticate_user!

  def show
    post = Post.find(params[:post_id])
    like_status = current_user.has_liked?(post)
    
  end

  def create
    like = current_user.likes.build(post_id: params[:post_id])
    like.save
    @post = Post.find(params[:post_id])
    @post.create_notification_like!(current_user)


  end

  def destroy
    @post = Post.find(params[:post_id])
    like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    like.destroy

  end

end