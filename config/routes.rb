Rails.application.routes.draw do
  root 'home#index'
  get '/about', to: 'home#about'
  get '/pricing', to: 'home#pricing'


  resources :contacts, only: %i[new create]

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' },
                     controllers: { registrations: 'users/registrations' }

  namespace :account do
    root to: 'dashboard#index'
    resources :users
    resource :profile, only: %i[show edit update]
    resources :device_groups, except: [:show]
  end
end
