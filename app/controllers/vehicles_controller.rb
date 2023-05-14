class VehiclesController < ApplicationController
  before_action :authenticate_user!
  def index
    getVehicles
    if params[:sort].present?
      sort_param = params[:sort].downcase
      @vehicles.sort_by! { |vehicle| vehicle[sort_param] }
    end
  end
  def get_vehicle_info
    @vehicle = params[:vehicle]
    @characters = []
    if !@vehicle['pilots'].nil?
      @vehicle['pilots'].map do |character|
        @characters << callToAPI(character)
      end
    end
    @movies = []
    @vehicle['films'].map do |movie|
      @movies << callToAPI(movie)
    end
    render :vehicle
  end
end
