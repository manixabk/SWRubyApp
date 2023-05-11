class FilmsController < ApplicationController
  before_action :authenticate_user!
  require 'net/http'
  require 'json'
  def index
    getMovies
    if params[:sort].present?
      sort_param = params[:sort].downcase
      @movies.sort_by! { |movie| movie[sort_param] }
    end
  end
  def getMovies
    @url = 'https://swapi.dev/api/films/'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
    @movies = @output['results']
  end
  def film
  end
  def get_movie_info
    @movie = params[:movie]
    @charactersName = []
    @movie['characters'].each do |character|
      url = character
      uri = URI(url)
      response = Net::HTTP.get(uri)
      output = JSON.parse(response)
      @charactersName << output['name']
    end
    render :film
  end
end
