# frozen_string_literal: true

class DosesController < ApplicationController
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktail_path(@dose.cocktail_id)
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.delete
    redirect_to cocktail_path(params[:cocktail_id])
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
