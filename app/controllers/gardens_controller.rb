class GardensController < ApplicationController
  before_action :set_garden, only: %i[destroy]

  def index
    @gardens = Garden.all
  end

  def create
    @user = current_user
    @garden = Garden.new(garden_params)
    @garden.user = @user

    if @garden.save
      redirect_to gardens_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @garden.destroy
      redirect_to root_path, status: :see_other
    else
      # render a _garden partial
      # render @garden, status: :unprocessable_entity
    end
  end

  private

  def set_garden
    @garden = Garden.find(params[:id])
  end

  def garden_params
    params.require(:garden).permit(:name)
  end
end
