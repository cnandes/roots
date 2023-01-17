class GardensController < ApplicationController
  before_action :set_garden, only: %i[show edit update destroy]
  before_action :set_gardens, only: %i[index upcoming]

  def index
    @garden = Garden.new
  end

  def show
    @bed = Bed.new
    @beds = @garden.beds
    @crop = Crop.new
    @veggie = Veggie.new
  end

  def create
    @user = current_user
    @garden = Garden.new(garden_params)
    @garden.user = @user

    if @garden.save
      redirect_to gardens_path, notice: "🪴 #{@garden.name} was added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @garden.update(garden_params)
      redirect_to gardens_path, notice: "🪴 #{@garden.name} was updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    garden_name = @garden.name
    if @garden.destroy
      redirect_to gardens_path, status: :see_other, notice: "🪴 #{garden_name} was removed!"
    else
      # render a _garden partial
      # render @garden, status: :unprocessable_entity
    end
  end

  def upcoming
  end

  private

  def garden_params
    params.require(:garden).permit(:name)
  end

  def set_garden
    @garden = Garden.find(params[:id])
  end

  def set_gardens
    @gardens = current_user.gardens
  end
end
