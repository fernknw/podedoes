Rails.application.routes.draw do
 
  get 'sessions/create'
  get 'sessions/destroy'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  match "/auth/failure" => redirect('/'), via: [:get,:post]
  #get 'signin', to: 'sessions#new', :as => :signin, via: [:get,:post]
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  
  resources :movies
  root :to => redirect('/movies')
  
  # add to routes.rb, just before or just after 'resources :movies' :

  # Route that posts 'Search TMDb' form
  post '/movies/search_tmdb'
end

