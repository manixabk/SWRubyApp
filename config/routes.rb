Rails.application.routes.draw do
  get 'search/index'
  get 'planets/index'
  get 'characters/index'
  get 'films/index', to: 'films#index', as: 'starwars/films'
  devise_for :users
  root 'home#index'
  get 'home/starwars'
  get '/get_movie_info', to: "films#get_movie_info", as: 'get_movie_info'
  get '/get_character_info', to: "characters#get_character_info", as: 'get_character_info'
  get '/search_field_tag', to: "search#search"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
