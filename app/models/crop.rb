require_relative '../../db/crop_emojis'

class Crop < ApplicationRecord
  belongs_to :veggie
  belongs_to :bed

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :weeks_to_harvest, presence: true, numericality: { greater_than: 0 }
  validates :emoji, inclusion: { in: EMOJI_ARRAY }
  validates :season, presence: true, inclusion: {
    in: %w[Summer Autumn Winter Spring],
    message: "%<value> is not a valid season"
  }
  validates :plant_date, comparison: { less_than_or_equal_to: Date.today }, allow_nil: true

  def harvested?
    plant_date && !planted
  end

  def season_background_colour
    case season
    when "Summer"
      # summer background colour
    when "Spring"
      # spring background colour
    when "Autumn"
      # autumn background colour
    when "Winter"
      # winter background colour
    end
  end
end
