Rails.application.routes.draw do
  root 'feed#index'

  devise_for :users
  resources :users, only: :show



end
