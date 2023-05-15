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
    @characters = get_specific_data(@planet['residents'])
    @movies = get_specific_data(@planet['films'])
    render :planet
  end
end
