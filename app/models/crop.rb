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
  validates :plant_date, comparison: { less_than_or_equal_to: Date.today }, presence: true, allow_nil: false, if: :planted?
  validates :planted, inclusion: [true, false]

  def harvested?
    plant_date && !planted
  end

  def progress
    # days = Date.today - Date.parse(plant_date.to_s)
    # weeks_since_planted = days / 7
    return weeks_since_planted < weeks_to_harvest ? (weeks_since_planted / weeks_to_harvest).to_f * 100 : 100
  end

  def weeks_since_planted
    days = Date.today - Date.parse(plant_date.to_s)
    days / 7
  end

  # def time_left_to_harvest
  #   percentage_weeks_left = progress / 100 * weeks
  # end
end
