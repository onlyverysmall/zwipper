class ZwippsController < ApplicationController
  before_action :authenticate_user!, except: :show

  def new
    @zwipp = Zwipp.new
  end

  def create
    @zwipp = current_user.zwipps.create(zwipp_params)

    if @zwipp.save
      redirect_to @zwipp
    else
      flash.now[:error] = @zwipp.errors.full_messages.to_sentence
      render @zwipp
    end
  end

  def show
    @zwipp = Zwipp.find(params[:id])
    @user = @zwipp.user
  end

  def destroy
    @zwipp = Zwipp.find(params[:id])

    if @zwipp.destroy
      flash[:notice] = 'Zwipp has been deleted'
      redirect_to current_user
    else
      flash.now[:error] = 'Zwipp could not be deleted'
      render nothing: true, status: :bad_request
    end
  end

  private

  def zwipp_params
    params.require(:zwipp).permit(:text)
  end
end
