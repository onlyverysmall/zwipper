class FeedController < ApplicationController
  before_action :authenticate_user!

  def index
    @zwipps = Zwipp.feed_for(current_user)
  end
end
