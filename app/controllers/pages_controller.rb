class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    # TO DO: define all of these 🤪
    # @current_garden =
    # @upcoming_gardens =
    # @past_gardens =
  end
end
