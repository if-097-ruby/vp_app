Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations"}
  
  namespace :account do
    resources :users
  end
end
