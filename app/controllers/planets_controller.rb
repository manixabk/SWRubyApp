class PlanetsController < ApplicationController
  before_action :authenticate_user!
  def index
    getPlanets
    if params[:sort].present?
      sort_param = params[:sort].downcase
      @planets.sort_by! { |planet| planet[sort_param] }
    end
  end
  def get_planet_info
    @planet = params[:planet]
    @characters = []
    @planet['residents'].each do |character|
      url = character
      uri = URI(url)
      response = Net::HTTP.get(uri)
      output = JSON.parse(response)
      @characters << output
    end
    render :planet
  end
end
