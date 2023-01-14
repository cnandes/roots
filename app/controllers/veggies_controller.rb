class VeggiesController < ApplicationController
  def index
    @veggies = Veggie.all
  end

  def create
    @veggie = Veggie.new(veggie_params)
    @veggie.name.capitalize!

    # this is quite hacky but it will work providing we do not call create outside of garden show page
    id = /\d+$/.match(request.referer)[0].to_i

    if @veggie.save
      redirect_to garden_path(Garden.find(id)), notice: "#{@veggie.name} has been added successfully!"
    else
      # TODO: same as the others - won't render in modal
      # render :new, status: :unprocessable_entity
    end
  end

  private

  def veggie_params
    params.require(:veggie).permit(:name, :season)
  end
end
