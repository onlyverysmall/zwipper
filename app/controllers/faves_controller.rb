class FavesController < ApplicationController
  before_action :authenticate_user!

  def create
    @fave = Fave.new(user: current_user, zwipp: zwipp)

    if @fave.save
      redirect_back
    else
      render nothing: true, status: :bad_request
    end
  end

  def destroy
    @fave = Fave.find_by(user: current_user, zwipp: zwipp)

    if @fave.destroy
      redirect_back
    else
      render nothing: true, status: :bad_request
    end
  end

  private

  def zwipp
    @zwipp ||= Zwipp.find(zwipp_params)
  end

  def zwipp_params
    params.require(:zwipp_id)
  end

  def redirect_back
    begin
      redirect_to :back
    rescue ActionController::RedirectBackError
      redirect_to zwipp
    end
  end
end
