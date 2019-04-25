Rails.application.routes.draw do
  mount ActionCable.server => "/cable"
  devise_for :users, controllers: { registrations: "users/registrations"}
  
  namespace :account do
    resources :users
  end
end
