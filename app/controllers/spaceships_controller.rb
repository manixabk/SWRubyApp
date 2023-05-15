class SpaceshipsController < ApplicationController
  before_action :authenticate_user!
  def index
    getStarships
    if params[:sort].present?
      sort_param = params[:sort].downcase
      @spaceships.sort_by! { |spaceship| spaceship[sort_param] }
    end
  end
  def get_spaceship_info
    @spaceship = params[:spaceship]
    @characters = get_specific_data(@spaceship['pilots'])
    @movies = get_specific_data(@spaceship['films'])
    render :spaceship
  end
end
