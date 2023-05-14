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
    residents = @planet['residents']
    if !residents.nil?
      @planet['residents'].map do |character|
        @characters << callToAPI(character)
      end
    end
    @movies = []
    @planet['films'].map do |movie|
      @movies << callToAPI(movie)
    end
    render :planet
  end
end
