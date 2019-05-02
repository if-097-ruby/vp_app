Rails.application.routes.draw do

  root 'home#index'
  get '/pricing',   to: 'home#pricing'

end