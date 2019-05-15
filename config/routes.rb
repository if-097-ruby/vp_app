Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' },
             controllers: { registrations: 'users/registrations' }

  namespace :account do
    root to: 'dashboard#index'
    resources :users
    resource :profile, only: [:show, :edit, :update]
  end
end
