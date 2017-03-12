Rails.application.routes.draw do
  root 'feed#index'

  devise_for :users
  resources :users, only: :show

  resources :zwipps, only: [:new, :create, :show, :destroy]

  delete 'follows', to: 'follows#destroy', via: :delete
  resources :follows, only: :create

  delete 'faves', to: 'faves#destroy', via: :delete, as: 'faves'
  resources :faves, only: :create
end
