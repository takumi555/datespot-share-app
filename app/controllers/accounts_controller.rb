class AccountsController < ApplicationController 

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id )
    
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(5)
  end
  
end