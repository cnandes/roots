class CropsController < ApplicationController
  def create
    @crop = Crop.new(crop_params)

    if @crop.save
      redirect_to garden_path(@crop.bed.garden)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def crop_params
    params.require(:crop).permit(:veggie_id, :bed_id, :quantity)
  end
end
