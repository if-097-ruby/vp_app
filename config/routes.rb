Rails.application.routes.draw do

  root 'public_pages#home'
  get  'public_pages/create'

  resources :contacts, only: [:new, :create]

end
