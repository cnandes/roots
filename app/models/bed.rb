class Bed < ApplicationRecord
  belongs_to :garden
  has_many :crops

  validates :description, presence: true
  validates :length, presence: true, numericality: { greater_than: 0 }
  validates :width, presence: true, numericality: { greater_than: 0 }
end
