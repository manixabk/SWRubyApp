class SpaceshipsController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:sort].present?
      sort(getStarships, params[:sort])
    end
  end
  def get_spaceship_info
    @spaceship = params[:spaceship]
    @characters = get_specific_data(@spaceship['pilots'])
    @movies = get_specific_data(@spaceship['films'])
    render :spaceship
  end
end
