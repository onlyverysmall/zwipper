Rails.application.routes.draw do
  root 'feed#index'

  devise_for :users



end
