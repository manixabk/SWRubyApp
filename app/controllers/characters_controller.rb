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
    render :character
  end
end