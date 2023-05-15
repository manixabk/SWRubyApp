class SpeciesController < ApplicationController
  before_action :authenticate_user!
  def index
    getSpecies
    if params[:sort].present?
      sort_param = params[:sort].downcase
      @species.sort_by! { |specie| specie[sort_param] }
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
