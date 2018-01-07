Rails.application.routes.draw do
  get 'webpages', to: 'webpages#index'
  resources :sessions, only: [:new,:create,:destroy]
  resources :favorites, only: [:create, :destroy]
  resources :users
  resources :blogs

end
