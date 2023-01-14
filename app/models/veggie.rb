class Veggie < ApplicationRecord
  has_many :beds, through: :crops

  validates :name, presence: true, uniqueness: true
  validates :season, presence: true, inclusion: {
    in: %w[Summer Autumn Winter Spring],
    message: "%<value> is not a valid season"
  }
end
