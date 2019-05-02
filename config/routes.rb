Rails.application.routes.draw do
  root 'home#index'

  namespace :account do
    resources :users, :dashboard
  end
end

