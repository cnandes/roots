require_relative '../../db/crop_emojis'

class Crop < ApplicationRecord
  belongs_to :veggie
  belongs_to :bed

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :duration, presence: true, numericality: { greater_than: 0 }
  validates :emoji, inclusion: { in: EMOJI_ARRAY }

  def date_planted
    return created_at.strftime(" %m/%d/%Y")
  end
end
