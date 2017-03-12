Rails.application.routes.draw do
  root 'feed#index'

  devise_for :users
  resources :users, only: :show


  delete 'follows', to: 'follows#destroy', via: :delete
  resources :follows, only: :create

  delete 'faves', to: 'faves#destroy', via: :delete
  resources :faves, only: :create
end
