Rails.application.routes.draw do
  
  post '/sessions' => 'sessions#create'
  get '/dashboard' => 'events#new'
  delete '/destroy' => 'events#destroy'
  get '/sign_in'  => 'sessions#new'

  post    'attendees', to: 'attendees#create'
  delete  '/destroy', to: 'attendees#delete'
  
  root to:  'sessions#new'

  get '/' => 'users#index'
  #resources :attendees
  resources :users
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
