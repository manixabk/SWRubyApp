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
    @characters = []
    @movie['characters'].map do |character|
      @characters << callToAPI(character)
    end
    @planets = []
    @movie['planets'].map do |planet|
      @planets << callToAPI(planet)
    end
    render :film
  end
end
