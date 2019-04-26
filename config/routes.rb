Rails.application.routes.draw do

  root 'public_pages#home'

  resources :contacts, only: [:new, :create]

end
