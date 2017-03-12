module ApplicationHelper
  def faves_zwipp?
    current_user && current_user.faved_zwipps.include?(@zwipp)
  end

  def follows_user?
    current_user.followees.include?(@user)
  end
end
