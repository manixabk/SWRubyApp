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
    @character['films'].map do |movie|
      @movies << callToAPI(movie)
    end
    @planet = callToAPI(@character['homeworld'])
    @species = []
    if !@character['species'].nil?
      @character['species'].map do |specie|
        @species << callToAPI(specie)
      end
    end
    @vehicles = []
    if !@character['vehicles'].nil?
      @character['vehicles'].map do |vehicle|
        @vehicles << callToAPI(vehicle)
      end
    end
    @spaceships = []
    if !@character['starships'].nil?
      @character['starships'].map do |spaceship|
        @spaceships << callToAPI(spaceship)
      end
    end
    render :character
  end
end