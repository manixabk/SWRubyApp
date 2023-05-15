Rails.application.routes.draw do
  get 'species/index'
  get 'vehicles/index'
  get 'spaceships/index'
  get 'search/index'
  get 'planets/index'
  get 'characters/index'
  get 'films/index', to: 'films#index', as: 'starwars/films'
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root to: 'films#index', as: :authenticated_root
    end
    unauthenticated do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  root 'home#index'
  get 'home/starwars'
  get '/get_movie_info', to: 'films#get_movie_info', as: 'get_movie_info'
  get '/get_character_info', to: 'characters#get_character_info', as: 'get_character_info'
  get '/get_planet_info', to: 'planets#get_planet_info', as: 'get_planet_info'
  get '/get_specie_info', to: 'species#get_specie_info', as: 'get_specie_info'
  get '/get_spaceship_info', to: 'spaceships#get_spaceship_info', as: 'get_spaceship_info'
  get 'get_vehicle_info', to: 'vehicles#get_vehicle_info', as: 'get_vehicle_info'
  get '/search_field_tag', to: 'search#search'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
