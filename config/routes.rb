Rails.application.routes.draw do
  
  root 'home#index'

  resources :contacts, only: [:new, :create]

  namespace :account do
    root to: 'dashboard#index'
    resources :users
  end  
  
end