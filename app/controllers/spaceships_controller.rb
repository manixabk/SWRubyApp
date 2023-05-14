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
    @characters = []
    if !@spaceship['pilots'].nil?
      @spaceship['pilots'].map do |character|
        @characters << callToAPI(character)
      end
    end
    @movies = []
    @spaceship['films'].map do |movie|
      @movies << callToAPI(movie)
    end
    render :spaceship
  end
end
