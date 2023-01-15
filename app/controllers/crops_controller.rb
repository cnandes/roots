class CropsController < ApplicationController
  before_action :set_crop, only: %i[update destroy plant]
  before_action :set_garden, only: %i[update destroy plant]

  def create
    @crop = Crop.new(crop_params)
    @crop.plant_date = Date.today if @crop.planted

    if @crop.save
      redirect_to garden_path(@crop.bed.garden)
    else
      # render :new, status: :unprocessable_entity
    end
  end

  def update
    # garden = @crop.bed.garden

    if @crop.update(crop_params)
      redirect_to garden_path(@garden), notice: "Crop has been updated!"
    else
      # TODO: Validation failures in modals
    end
  end

  def destroy
    # garden = @crop.bed.garden
    if @crop.destroy
      redirect_to garden_path(@garden), notice: "Crop was successfully removed!"
    else
      render garden, status: :unprocessable_entity
    end
  end

  # This method "plants" crops which have not been planted yet and updates plant_date.
  def plant
    return if @crop.planted

    # garden = @crop.bed.garden
    @crop.planted = true
    @crop.plant_date = Date.today
    if @crop.save
      redirect_to garden_path(@garden), notice: "Crop has been planted!"
    else
        # TODO: Validation failures in modals
    end
  end

  def crop_params
    params.require(:crop).permit(:veggie_id, :bed_id, :quantity, :weeks_to_harvest, :emoji, :comment, :plant_date, :planted, :season)
  end

  def set_crop
    @crop = Crop.find(params[:id])
  end

  def set_garden
    @garden = @crop.bed.garden
  end
end
