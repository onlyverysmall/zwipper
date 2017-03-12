class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    @follow = Follow.new(follower: current_user, followee: followee)

    if @follow.save
      flash[:info] = "You are now following #{ followee.username }"
      redirect_to followee
    else
      flash.now[:danger] = "Could not follow #{ followee.username }"
      render nothing: true, status: :bad_request
    end
  end

  def destroy
    @follow = Follow.find_by(follower: current_user, followee: followee)

    if @follow.destroy
      flash[:info] = "You are no longer following #{ followee.username }"
      redirect_to followee
    else
      flash.now[:danger] = "Could not unfollow #{ followee.username }"
      render nothing: true, status: :bad_request
    end
  end

  private

  def followee
    User.find(followee_params)
  end

  def followee_params
    params.require(:followee_id)
  end
end
