class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    # TO DO: define all of these 🤪
    # @current_garden = [array of crops that are planted: true]
    # @upcoming_gardens = [array of crops planted: false, plant_date.empty?]
    # @past_gardens = [array of crops planted: false, plant_date: true]
  end
end
