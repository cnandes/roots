class BedsController < ApplicationController
  def new
  end

  def create
    @garden = Garden.find(params[:garden_id])
    @bed = Bed.new(bed_params)
    @bed.garden = @garden
    if @bed.save
      redirect_to garden_path(@garden)
    else
      # to do: figure out how to get this error to work
      render "gardens/show", status: :unprocessable_entity
    end
  end

  private

  def bed_params
    params.require(:bed).permit(:description, :length, :width)
  end
end
