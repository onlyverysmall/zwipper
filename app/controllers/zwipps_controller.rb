class ZwippsController < ApplicationController
  before_action :authenticate_user!, except: :show

  def new
    @zwipp = Zwipp.new
  end

  def create
    @zwipp = current_user.zwipps.create(zwipp_params)

    if @zwipp.save
      flash[:info] = "Your zwipp is published!"
      redirect_to @zwipp
    else
      flash.now[:danger] = @zwipp.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @zwipp = Zwipp.find(params[:id])
    @user = @zwipp.user
  end

  def destroy
    @zwipp = Zwipp.find(params[:id])

    if @zwipp.destroy
      flash[:info] = 'Zwipp has been deleted'
      redirect_to current_user
    else
      flash.now[:danger] = 'Zwipp could not be deleted'
      render nothing: true, status: :bad_request
    end
  end

  private

  def zwipp_params
    params.require(:zwipp).permit(:text)
  end
end
