class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	require 'net/http'
  	require 'json'
	def getMovies
	    @url = 'https://swapi.dev/api/films/'
	    @uri = URI(@url)
	    @response = Net::HTTP.get(@uri)
	    @output = JSON.parse(@response)
	    @movies = @output['results']
 	end
 	def getCharacters
 		@url = 'https://swapi.dev/api/people/'
	    @uri = URI(@url)
	    @response = Net::HTTP.get(@uri)
	    @output = JSON.parse(@response)
	    @characters = @output['results']
 	end
 	def getPlanets
 		@url = 'https://swapi.dev/api/planets/'
	    @uri = URI(@url)
	    @response = Net::HTTP.get(@uri)
	    @output = JSON.parse(@response)
	    @planets = @output['results']
 	end
end
