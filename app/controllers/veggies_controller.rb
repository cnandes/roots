class VeggiesController < ApplicationController
  def index
    @veggies = Veggie.all
  end

  def create
    @veggie = Veggie.new(veggie_params)
    if @veggie.save
      redirect_to veggies_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def veggie_params
    params.require(:veggie).permit(:name)
  end
end
