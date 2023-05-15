class CharactersController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:sort].present?
      sort(@characters, params[:sort])
    end
  end
  def character
  end
  def get_character_info
    @character = params[:character]
    @movies = get_specific_data(@character['films'])
    @planet = callToAPI(@character['homeworld'])
    @species = get_specific_data(@character['species'])
    @vehicles = get_specific_data(@character['vehicles'])
    @spaceships = get_specific_data(@character['starships'])
    render :character
  end
end