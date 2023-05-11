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
    @movie['characters'].each do |character|
      url = character
      uri = URI(url)
      response = Net::HTTP.get(uri)
      output = JSON.parse(response)
      @characters << output
    end
    @planets = []
    @movie['planets'].each do |planet|
      url = planet
      uri = URI(url)
      response = Net::HTTP.get(uri)
      output = JSON.parse(response)
      @planets << output
    end
    render :film
  end
end
