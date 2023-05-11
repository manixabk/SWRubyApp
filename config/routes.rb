Rails.application.routes.draw do
  get 'planets/index'
  get 'characters/index'
  get 'films/index', to: 'films#index', as: 'starwars/films'
  devise_for :users
  root 'home#index'
  get 'home/starwars'
  get '/get_movie_info', to: "films#get_movie_info", as: 'get_movie_info'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
