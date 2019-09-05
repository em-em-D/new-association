# frozen_string_literal: true

# :nodoc:
Rails.application.routes.draw do
  # get 'events/index'
  # get 'events/new'
  # get 'events/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/user_path',   to: 'users#show'
  get '/signup',      to: 'users#new'
  post '/signup',     to: 'users#create'
  get '/login',       to: 'sessions#new'
  post '/login',      to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  root 'sessions#new'
  get '/eventlist', to: 'events#index'
  get     '/events',      to: 'events#new'
  post    '/events',      to: 'events#create'
  get '/dashboard' => 'events#new'
  delete '/destroy/:id' => 'events#destroy'

  post    '/attendaces', to: 'attendaces#create'
  delete  '/attendaces', to: 'attendaces#destroy'

  resources :users
  resources :events, only: %i[index show destroy]
end
