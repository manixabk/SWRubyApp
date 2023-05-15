class FilmsController < ApplicationController
  before_action :authenticate_user!
  def index
    getMovies
    if params[:sort].present?
      sort_param = params[:sort].downcase
      @movies.sort_by! { |movie| movie[sort_param] }
    end
  end
  def film
  end
  def get_movie_info
    @movie = params[:movie]
    @characters = get_specific_data(@movie['characters'])
    @planets = get_specific_data(@movie['planets'])
    @spaceships = get_specific_data(@movie['starships'])
    @vehicles = get_specific_data(@movie['vehicles'])
    @species = get_specific_data(@movie['species'])
    render :film
  end
end
