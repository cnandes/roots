class GardensController < ApplicationController
  before_action :set_garden, only: %i[edit update]
  def edit
  end

  def update
    if @garden.update(garden_params)
      redirect_to root_path, notice: "NapSpace was successfully update."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def garden_params
    params.require(:garden).permit(:name)
  end

  def set_garden
    @garden = Garden.find(params[:id])
  end
end
