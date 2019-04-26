Rails.application.routes.draw do
  get 'public_pages/home'
  get  '/pricing',    to: 'public_pages#pricing'
end
