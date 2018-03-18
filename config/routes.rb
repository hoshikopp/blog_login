Rails.application.routes.draw do

  root to: 'home#index'
  get 'webpages', to: 'webpages#index'
  resources :sessions, only: [:new,:create,:destroy]
  resources :favorites, only: [:create, :destroy]
  resources :users
  resources :blogs do
    resources :comments
  end

end
