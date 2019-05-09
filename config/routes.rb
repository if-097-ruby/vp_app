Rails.application.routes.draw do
  
  root 'home#index'

  resources "contacts", only: [:create]
  get '/contacts', to: 'contacts#new'

  namespace :account do
    root to: 'dashboard#index'
    resources :users
  end  
  
end