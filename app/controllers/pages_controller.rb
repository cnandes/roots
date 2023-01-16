class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @gardens = current_user.gardens
    # @crops = current_user.crops
    # @crops_history_date_range = crops_history_date_range(@crops)
  end

  privates

  # def crops_history_date_range(crops)
  #   first = crops.first.created_at.year
  #   last = Date.today.year
  #   return (first..last)
  # end
end
