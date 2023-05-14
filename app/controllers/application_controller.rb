class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	require 'net/http'
  	require 'json'
	def getMovies
	    @movies = callToAPI('https://swapi.dev/api/films/')['results']
 	end
 	def getCharacters
	    @characters = callToAPI('https://swapi.dev/api/people/')['results']
 	end
 	def getPlanets
	    @planets = callToAPI('https://swapi.dev/api/planets/')['results']
 	end
 	def getSpecies
	    @species = callToAPI('https://swapi.dev/api/species/')['results']
 	end
 	def getStarships
	    @spaceships = callToAPI('https://swapi.dev/api/starships/')['results']
 	end
 	def getVehicles
	    @vehicles = callToAPI('https://swapi.dev/api/vehicles/')['results']
 	end
 	def callToAPI(url)
 		if url && !url.empty?
	 		uri = URI(url)
	 		response = Net::HTTP.get(uri)
	 		JSON.parse(response)
 		end
 	end
end
