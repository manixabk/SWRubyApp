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
    @characters = get_specific_data(@vehicle['pilots'])
    @movies = get_specific_data(vehicle['films'])
    render :vehicle
  end
end
