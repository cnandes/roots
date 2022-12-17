class GardensController < ApplicationController

  def index
    @gardens = Garden.all
  end

  def create
    @garden = Garden.new
  end
end
