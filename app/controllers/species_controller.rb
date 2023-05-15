class SpeciesController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:sort].present?
      sort(getSpecies, params[:sort])
    end
  end
  def get_specie_info
    @specie = params[:specie]
    @planet = callToAPI(@specie['homeworld'])
    @characters = get_specific_data(@specie['people'])
    @movies = get_specific_data(@specie['films'])
    render :specie
  end
end
