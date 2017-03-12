class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @zwipps = @user.zwipps.order(created_at: :desc)
    @followee_count = @user.followees.count
    @follower_count = @user.followers.count
  end
end
