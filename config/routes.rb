Rails.application.routes.draw do
  post '/sessions' => 'sessions#create'
  get '/dashboard' => 'events#index'

  #get '/' => 'users#index'
  
  resources :users
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
