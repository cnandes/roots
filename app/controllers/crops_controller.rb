class CropsController < ApplicationController
  before_action :set_crop, only: %i[destroy plant_now]

  def create
    @crop = Crop.new(crop_params)
    @crop.plant_date = Date.today if @crop.planted

    if @crop.save
      redirect_to garden_path(@crop.bed.garden)
    else
      # render :new, status: :unprocessable_entity
    end
  end

  def destroy
    garden = @crop.bed.garden
    if @crop.destroy
      redirect_to garden_path(garden), notice: "Crop was successfully removed."
    else
      render garden, status: :unprocessable_entity
    end
  end

  def plant_now
    return if @crop.planted

    @crop.planted = true
    @crop.plant_date = Date.today
    @crop.save
  end

  def crop_params
    params.require(:crop).permit(:veggie_id, :bed_id, :quantity, :weeks_to_harvest, :emoji, :comment, :plant_date, :planted, :season)
  end

  def set_crop
    @crop = Crop.find(params[:id])
  end
end
