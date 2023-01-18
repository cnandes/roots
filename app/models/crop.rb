require_relative '../../db/crop_emojis'

class Crop < ApplicationRecord
  belongs_to :veggie
  belongs_to :bed

  validates :quantity, presence: true, numericality: { greater_than: 0, less_than: 2_147_483_640 }
  validates :weeks_to_harvest, presence: true, numericality: { greater_than: 0, less_than: 2_147_483_640 }
  validates :emoji, inclusion: { in: EMOJI_ARRAY }
  validates :season, presence: true, inclusion: {
    in: %w[Summer Autumn Winter Spring],
    message: "%<value> is not a valid season"
  }
  validates :plant_date, comparison: { less_than_or_equal_to: Date.today }, allow_nil: true

  def harvested?
    plant_date && !planted
  end

  def progress
    days = Date.today - Date.parse(plant_date.to_s)
    weeks = days / 7
    return (weeks / weeks_to_harvest).to_f * 100
  end
end
