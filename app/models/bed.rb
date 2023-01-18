class Bed < ApplicationRecord
  belongs_to :garden
  has_many :crops, dependent: :destroy

  validates :description, presence: true

  def planted_crops
    return crops.where(planted: true)
  end

  def future_crops
    crops.where(planted: false, plant_date: nil)
  end

  # this seems like a cooked way to do this method but it works lol - commented out as not used on this branch
  # def past_crops
  #   crops.where(planted: false) - crops.where(planted: false, plant_date: nil)
  # end
end
