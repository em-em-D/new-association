Rails.application.routes.draw do
  get 'attendees/index'
  get 'attendees/new'
  get 'attendees/create'
  get 'attendees/destroy'
  post '/sessions' => 'sessions#create'
  get '/dashboard' => 'events#new'
  get '/sign_in'  => 'sessions#new'
  
  root to:  'sessions#new'

  #get '/' => 'users#index'
  
  resources :users
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
