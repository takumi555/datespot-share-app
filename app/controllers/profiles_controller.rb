class ProfilesController < ApplicationController
  def show
    @profile = current_user.prepare_profile
    @post = Post.where(user_id: current_user.id )
  end

  def update
    @profile = current_user.prepare_profile
    @profile.id = current_user.id
    @profile.assign_attributes(profile_params)
    if @profile.save
      redirect_to profile_path, notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :show
    end

  end

  private
  def profile_params
    params.require(:profile).permit(:avatar)
  end

end