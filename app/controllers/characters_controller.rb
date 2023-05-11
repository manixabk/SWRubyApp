class CharactersController < ApplicationController
  before_action :authenticate_user!
  def index
    getCharacters
    if params[:sort].present?
      sort_param = params[:sort].downcase
      @characters.sort_by! { |character| character[sort_param] }
    end
  end
  def character
  end
  def get_character_info
    @character = params[:character]
    @movies = []
    @character['films'].each do |movie|
      url = movie
      uri = URI(url)
      response = Net::HTTP.get(uri)
      output = JSON.parse(response)
      @movies << output
    end
    url = @character['homeworld']
    uri = URI(url)
    response = Net::HTTP.get(uri)
    output = JSON.parse(response)
    @planet = output
    render :character
  end
end