class GardensController < ApplicationController
  before_action :set_garden, only: %i[show edit update destroy]

  def index
    @gardens = current_user.gardens
    @garden = Garden.new
    @info = INDEX_INFO
  end

  def show
    @bed = Bed.new
    @beds = @garden.beds
    @crop = Crop.new
    @veggie = Veggie.new
    @season = season
    @veggie_lists_by_season = seasonal_veggie_lists
    @seasonal_titles = SEASONAL_TITLES
    @info = SHOW_INFO
  end

  def create
    @user = current_user
    @garden = Garden.new(garden_params)
    @garden.user = @user

    if @garden.save
      redirect_to gardens_path, notice: "🪴 #{@garden.name} was added!"
    else
      render partial: "gardens/new_garden_form", status: :unprocessable_entity
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

  def season
    year_day = Date.today.yday().to_i
    year = Date.today.year.to_i
    is_leap_year = ((year % 4).zero? && (year % 100 != 0)) || (year % 400).zero?
    if is_leap_year && year_day > 60
      # if is leap year  and date > 28 february
      year_day -= 1
    end

    if year_day >= 355 || year_day < 81
      result = "Summer"
    elsif year_day >= 81 && year_day < 173
      result = "Autumn"
    elsif year_day >= 173 && year_day < 266
      result = "Winter"
    elsif year_day >= 266 && year_day < 355
      result = "Spring"
    end

    result
  end

  def seasonal_veggie_lists
    seasons = %w[Summer Autumn Winter Spring]
    seasons.map { |season| Veggie.seasonal_veggies(season) }
  end

  SEASONAL_TITLES = {
    Summer: "🌻 Summer 🌻",
    Autumn: "🍁 Autumn 🍁",
    Winter: "❄️ Winter ❄️",
    Spring: "🌸 Spring 🌸"
  }

  INDEX_INFO = {
    title: "My Gardens",
    brief: "This is the gardens page, where you will find a summary of your current gardens.",
    tips: [
      "To add a new garden, click the 'Add Garden' button in the top right",
      "Buttons to edit and delete gardens can be found to the right of the garden name",
      "To view the garden simply click the garden title",
      "Crops will appear in your beds once planted, with a progress indicator to let you know when to harvest"
    ]
  }

  SHOW_INFO = {
    title: "Garden Beds",
    brief: "This is the garden page, where you will find info about beds in this garden.",
    tips: [
      "To add a new garden bed, click the 'Add bed' button in the top right",
      "To add a crop of Veggies to your garden bed, click the 'Add Crop' button in the top right corner of the bed card",
      "When adding a new crop, select the season for relavant recommendations",
      "You can plan for future crops by selecting 'No' when prompted by 'Has the crop been planted?'"
    ]
  }
end
