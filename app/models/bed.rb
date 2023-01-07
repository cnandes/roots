class Bed < ApplicationRecord
  belongs_to :garden
  has_many :crops, dependent: :destroy

  validates :description, presence: true
  validates :length, presence: true, numericality: { greater_than: 0 }
  validates :width, presence: true, numericality: { greater_than: 0 }
end
