class VeggiesController < ApplicationController
  def index
    @veggies = Veggie.all
  end

  def new
    @veggie = Veggie.new
  end

  def create
    @veggie = Veggie.new(veggie_params)
    if @veggie.save
      if params[:garden_id]
        redirect_to gardens_path(Garden.find(params[:garden_id]))
      else
        redirect_to new_veggy_path, notice: "#{@veggie.name} has been added!"
      end
    else
      # TODO: same as the others - won't render in modal
      # render :new, status: :unprocessable_entity
    end
  end

  private

  def veggie_params
    params.require(:veggie).permit(:name)
  end
end
