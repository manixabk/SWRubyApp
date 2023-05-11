class SearchController < ApplicationController
  def index
  end
  def search
    if params[:query].blank? || params[:query].nil?
      redirect_to starwars_films_path and return
    else
      @tag = params[:query]
      getMovies
      @movies = @movies.select{|movie| movie['title'].downcase.include?(@tag)}
      getCharacters
      @characters = @characters.select{|character| character['name'].downcase.include?(@tag)}
      getPlanets
      @planets = @planets.select{|planet| planet['name'].downcase.include?(@tag)}
    end
    render :search
  end
end
