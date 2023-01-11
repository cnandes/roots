class Veggie < ApplicationRecord
  has_many :beds, through: :crops

  validates :name, presence: true

  # method for front end testing only
  def emoji
    emoji_array = %i[🍎 🌽 🥑 🥝 🍌 🥦 🍑 🍅 🍆]
    return emoji_array.sample
  end
end
