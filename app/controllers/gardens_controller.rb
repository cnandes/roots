class GardensController < ApplicationController

  def index
    @gardens = Garden.all
  end

  def create
    @user = current_user
    @garden = Garden.new(strong_params)
    @garden.user = @user

    if @garden.save
      redirect_to gardens_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def strong_params
    params.require(:garden).permit(:name)
  end
end
