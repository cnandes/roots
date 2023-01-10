class CropsController < ApplicationController
  before_action :set_crop, only: %i[destroy]

  def create
    @crop = Crop.new(crop_params)

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
      # notice: "Crop removal was unsuccessful."
    end
  end

  def crop_params
    params.require(:crop).permit(:veggie_id, :bed_id, :quantity)
  end

  def set_crop
    @crop = Crop.find(params[:id])
  end
end
