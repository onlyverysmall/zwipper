class FavesController < ApplicationController
  before_action :authenticate_user!

  def create
    @fave = Fave.new(user: current_user, zwipp: zwipp)

    if @fave.save
      render nothing: true, status: :ok
    else
      render nothing: true, status: :bad_request
    end
  end

  def destroy
    @fave = Fave.find_by(user: current_user, zwipp: zwipp)

    if @fave.destroy
      render nothing: true, status: :ok
    else
      render nothing: true, status: :bad_request
    end
  end

  private

  def zwipp
    Zwipp.find(zwipp_params)
  end

  def zwipp_params
    params.require(:zwipp_id)
  end
end
