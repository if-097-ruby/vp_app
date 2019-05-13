Rails.application.routes.draw do
  root 'home#index'
  get '/about', to: 'home#about'

  namespace :account do
    root to: 'dashboard#index'
    resources :users
  end  
end