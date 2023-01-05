class BedsController < ApplicationController
  before_action :set_garden, only: %i[index create]
  def index
    @beds = @garden.beds
  end

  def create
    @bed = Bed.new(bed_params)
    @bed.garden = @garden
    if @bed.save
      redirect_to garden_path(@garden)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bed_params
    params.require(:bed).permit(:description, :length, :width)
  end

  def set_garden
    @garden = Garden.find(params[:id])
  end
end
