class CropsController < ApplicationController
  before_action :set_crop, only: %i[update destroy plant harvest]
  before_action :set_garden, only: %i[update destroy plant harvest]

  def create
    @crop = Crop.new(crop_params)
    @crop.plant_date = Date.today if @crop.planted

    if @crop.save
      redirect_to garden_path(@crop.bed.garden), notice: "#{@crop.emoji} #{@crop.veggie.name} have been added!"
    else
      # TODO: Validation failures in modals
    end
  end

  def update
    if @crop.update(crop_params)
      redirect_to garden_path(@garden), status: :see_other, notice: "#{@crop.emoji} #{@crop.veggie.name} have been updated!"
    else
      # TODO: Validation failures in modals
    end
  end

  def destroy
    veggie_name = @crop.veggie.name
    crop_emoji = @crop.emoji
    if @crop.destroy
      redirect_to garden_path(@garden), status: :see_other, notice: "#{crop_emoji} #{veggie_name} have been removed!"
    else
      # TODO: Validation failures in modals
      render garden, status: :unprocessable_entity
    end
  end

  # This method "plants" crops which have not been planted yet and updates plant_date.
  def plant
    return if @crop.planted

    @crop.planted = true
    @crop.plant_date = Date.today
    if @crop.save
      redirect_to garden_path(@garden), notice: "#{@crop.emoji} #{@crop.veggie.name} have been planted!"
    else
        # TODO: Validation failures in modals
    end
  end

  # This method "harvests" crops which have been planted.
  def harvest
    return unless @crop.planted
    return unless @crop.plant_date

    @crop.planted = false
    if @crop.save
      redirect_to garden_path(@garden), notice: "#{@crop.emoji} #{@crop.veggie.name} have been harvested!"
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
