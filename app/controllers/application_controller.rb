class ApplicationController < ActionController::Base
	before_action :authenticate_user!, :init_data
	require 'net/http'
  	require 'json'
  	BASEURL = 'https://swapi.dev/api/'
  	# Method to get the movies, it will cache the data using memorization so
  	# it only makes the call to the API once.
	def getMovies
	    @movies ||= callToAPI(BASEURL + 'films/')['results']
 	end
 	def getCharacters
	    @characters ||= callToAPI(BASEURL + 'people/')['results']
 	end
 	def getPlanets
	    @planets ||= callToAPI(BASEURL + 'planets/')['results']
 	end
 	def getSpecies
	    @species ||= callToAPI(BASEURL + 'species/')['results']
 	end
 	def getStarships
	    @spaceships ||= callToAPI(BASEURL + 'starships/')['results']
 	end
 	def getVehicles
	    @vehicles ||= callToAPI(BASEURL + 'vehicles/')['results']
 	end
 	
 	# Method to access API
 	# This method will check if the url given is correct before trying to call the API, if the API give an answer, parse the response into a JSON
 	# otherwise throw an error and return an empty hash
 	# @param url [String] url to the API data
 	def callToAPI(url)
	  if url && !url.empty?
	    begin
	      uri = URI(url)
	      response = Net::HTTP.get(uri)
	      JSON.parse(response)
	    rescue StandardError => e
	      Rails.logger.error("Error calling API: #{e.message}")
	      {}
	    end
	  else
	    {}
	  end
	end
	# Method used to get data 
	# @param
 	def get_specific_data(urls)
	    data = []
	    if !urls.nil?
	      urls.map do |link|
	        data << callToAPI(link)
	      end
	    end
	    data
  	end
  	def sort(array, sort_param)
	    array.sort_by! { |object| object[sort_param] }
  	end
  	def init_data
  		getMovies
  		getCharacters
  		getPlanets
  		getSpecies
  		getStarships
  		getVehicles
  	end
end
