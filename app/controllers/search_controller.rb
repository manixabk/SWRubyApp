class SearchController < ApplicationController
  def index
  end
  def search
    if params[:query].blank? || params[:query].nil?
      redirect_to starwars_films_path and return
    else
      @tag = params[:query].downcase
      getMovies
      @movies = filter(@movies, @tag)
      getCharacters
      @characters = filter(@characters, @tag)
      getPlanets
      @planets = filter(@planets, @tag)
      getSpecies
      @species = filter(@species, @tag)
      getStarships
      @spaceships = filter(@spaceships, @tag)
      getVehicles
      @vehicles = filter(@vehicles, @tag)
    end
    render :search
  end
  def filter(data, tag)
    filteredData = data.select do |object|
      object.values.any? { |value| value.to_s.downcase.include?(tag) }
    end
    return filteredData
  end
end
