class GardensController < ApplicationController
  before_action :set_garden, only: %i[show edit update destroy]

  def edit
  end

  def update
    if @garden.update(garden_params)
      redirect_to gardens_path, notice: "Garden was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def index
    @gardens = current_user.gardens
    @garden = Garden.new
  end

  def show
    @bed = Bed.new
    @beds = @garden.beds
    @crop = Crop.new
    @veggie = Veggie.new
    @season = season
    @seasonal_veggies = seasonal_veggie_lists
    @seasonal_titles = SEASONAL_TITLES
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
      redirect_to gardens_path, status: :see_other
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
    Summer: "🌻 ~ Summer Veggies ~ 🌻",
    Autumn: "🍁 ~ Autumn Veggies ~ 🍁",
    Winter: "❄️ ~ Winter Veggies ~ ❄️",
    Spring: "🌷 ~ Spring Veggies ~ 🌷"
  }
end
