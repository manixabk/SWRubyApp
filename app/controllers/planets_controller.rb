class PlanetsController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:sort].present?
      sort(getPlanets, params[:sort])
    end
  end
  def get_planet_info
    @planet = params[:planet]
    @characters = get_specific_data(@planet['residents'])
    @movies = get_specific_data(@planet['films'])
    render :planet
  end
end
