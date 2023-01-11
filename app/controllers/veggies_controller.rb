class VeggiesController < ApplicationController
  def index
    @veggies = Veggie.all
  end

  def create
    @veggie = Veggie.new(veggie_params)
    if @veggie.save
      redirect_to :back
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
