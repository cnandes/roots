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
end
