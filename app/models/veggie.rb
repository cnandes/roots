class Veggie < ApplicationRecord
  has_many :beds, through: :crops

  validates :name, presence: true
end
