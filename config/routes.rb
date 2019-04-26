Rails.application.routes.draw do

  root 'public_pages#home'
  get  'public_pages/contact_us'

  resources :contacts, only: [:new, :create]

end
