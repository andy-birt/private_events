Rails.application.routes.draw do
  root 'events#index'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resource :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :events
  resources :invites
end
