class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_gardens, only: %i[plans history]

  def home
  end

  def plans
  end

  def history
  end
  # def crops_history_date_range(crops)
  #   first = crops.first.created_at.year
  #   last = Date.today.year
  #   return (first..last)
  # end

  private

  def set_gardens
    @gardens = current_user.gardens
  end
end
