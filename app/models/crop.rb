class Crop < ApplicationRecord
  belongs_to :veggie
  belongs_to :bed

  validates :name, presence: true, numericality: { greater_than: 0 }
end
