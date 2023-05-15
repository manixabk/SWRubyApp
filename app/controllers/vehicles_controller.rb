class VehiclesController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:sort].present?
      sort(getVehicles, params[:sort])
    end
  end
  def get_vehicle_info
    @vehicle = params[:vehicle]
    @characters = get_specific_data(@vehicle['pilots'])
    @movies = get_specific_data(vehicle['films'])
    render :vehicle
  end
end
