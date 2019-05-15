Rails.application.routes.draw do
  
  root 'home#index'

  resources :contacts, only: [:new, :create]

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' },
             controllers: { registrations: 'users/registrations' }

  namespace :account do
    root to: 'dashboard#index'
    resources :users
  end
end

