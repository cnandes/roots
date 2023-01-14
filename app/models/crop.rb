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
  validates :plant_date, comparison: { less_than_or_equal_to: Date.today }

  def date_planted
    return created_at.strftime(" %m/%d/%Y")
  end

  def season_background_colour
    if season == "Summer"
      # summer background colour
    elsif season == "Spring"
      # spring background colour
    elsif season == "Autumn"
      # autumn background colour
    else
      # winter background colour
    end
  end
end
