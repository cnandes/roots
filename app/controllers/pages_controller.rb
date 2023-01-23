class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_gardens, only: %i[plans history]

  def home
  end

  def plans
    @info = PLANS_INFO
  end

  def history
    @crops = current_user.crops
    @year_range = history_year_range(@crops)
    @season = params[:season].present? ? params[:season] : nil
    @year = params[:year].present? ? params[:year].to_i : nil
    @info = HISTORY_INFO
  end

  private

  def history_year_range(crops)
    past_crops = crops - crops.where(plant_date: nil) - crops.where(planted: true)
    past_crops.sort_by!(&:plant_date)
    return past_crops.present? ? (past_crops.first.plant_date.year..past_crops.last.plant_date.year) : [Date.today.year]
  end

  def set_gardens
    @gardens = current_user.gardens
  end

  PLANS_INFO = {
    title: "Plans",
    brief: "This is the planning page, where you will find info about upcoming crops",
    tips: [
      "To view upcoming crops, select the upcoming season from the drop down menu",
      "You can add future crops from the garden page, simply click the garden and you will be redirected"
    ]
  }

  HISTORY_INFO = {
    title: "History",
    brief: "This is the history page, where you can find info about past crops",
    tips: [
      "To view past crops, select the year and season from the drop down menu",
      "Historic crops will automatically show up here once they have been harvested"
    ]
  }
end
