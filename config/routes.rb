Rails.application.routes.draw do
  root 'home#index'

  namespace :account do
    root to: 'dashboard#index'
    resources :users
    resources :device_groups
  end
end