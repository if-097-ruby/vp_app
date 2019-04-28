Rails.application.routes.draw do
  namespace :account do
    resources :users
  end
end
