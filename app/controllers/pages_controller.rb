class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_gardens, only: %i[plans history]

  def home
  end

  def plans
  end

  def history
    @crops = current_user.crops
    @year_range = history_year_range(@crops)
  end

  private

  # def history_year_range(crops)
  #   past_crops = crops - crops.where(plant_date: nil) - crops.where(planted: true)
  #   past_crops.sort_by!(&:plant_date)
  #   (past_crops.first.plant_date.year..past_crops.last.plant_date.year)
  # end

  def set_gardens
    @gardens = current_user.gardens
  end
end
