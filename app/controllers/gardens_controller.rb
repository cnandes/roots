class GardensController < ApplicationController
  before_action :set_garden, only: %i[show edit update destroy]
  def edit
  end

  def update
    if @garden.update(garden_params)
      redirect_to root_path, notice: "NapSpace was successfully update."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def index
    @gardens = Garden.all
    @garden = Garden.new
  end

  def show
    @beds = @garden.beds
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


  def garden_params
    params.require(:garden).permit(:name)
  end

  def set_garden
    @garden = Garden.find(params[:id])
  end
end
