class SearchController < ApplicationController
  def index
  end
  def search
    if params[:query].blank? || params[:query].nil?
      redirect_to starwars_films_path and return
    else
      @tag = params[:query].downcase
      @movies = filter(@movies, @tag)
      @characters = filter(@characters, @tag)
      @planets = filter(@planets, @tag)
      @species = filter(@species, @tag)
      @spaceships = filter(@spaceships, @tag)
      @vehicles = filter(@vehicles, @tag)
    end
    render :search
  end
  def filter(data, tag)
    if !data.nil?
      filteredData = data.select do |object|
        object.values.any? { |value| value.to_s.downcase.include?(tag) }
      end
      return filteredData
    end
    return []
  end
end
