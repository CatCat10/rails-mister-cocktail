class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    @dose.save
    redirect_to cocktail_path(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
