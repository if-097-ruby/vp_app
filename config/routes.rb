Rails.application.routes.draw do
  root 'home#index'
  get '/pricing',   to: 'home#pricing'

  namespace :account do
    root to: 'dashboard#index'
    resources :users
  end  
end