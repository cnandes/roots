class Veggie < ApplicationRecord
  has_many :beds, through: :crops
  has_many :veggie_tips, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :season, presence: true, inclusion: {
    in: %w[Summer Autumn Winter Spring],
    message: "%<value> is not a valid season"
  }

  def seasonal_veggie?(season_string)
    season == season_string
  end

  def self.seasonal_veggies(season_string)
    all.select { |veggie| veggie.seasonal_veggie?(season_string) }
  end
end
