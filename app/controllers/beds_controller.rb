class BedsController < ApplicationController
  before_action :set_bed, only: %i[edit update]

  def new
  end

  def create
    @garden = Garden.find(params[:garden_id])
    @bed = Bed.new(bed_params)
    @bed.garden = @garden
    if @bed.save
      redirect_to garden_path(@garden)
    else
      # TO DO: figure out how to get this error to work
      # render "gardens/show", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @bed.update(bed_params)
      redirect_to garden_path(@garden), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def bed_params
    params.require(:bed).permit(:description, :length, :width)
  end

  def set_bed
    @bed = Bed.find(params[:id])
    @garden = @bed.garden
  end
end
