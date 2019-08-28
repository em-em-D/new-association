Rails.application.routes.draw do
  # get 'events/index'
  # get 'events/new'
  # get 'events/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/signup',      to: 'users#new'
  post '/signup',     to: 'users#create'
  get '/login',       to: 'sessions#new'
  post '/login',      to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  root 'sessions#new'
  
  get '/dashboard' => 'events#new'
  resources :users

  # resources :users do
  #   member do
  #     get :events
  #   end
  # end

  resources :events
end
