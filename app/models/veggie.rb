class Veggie < ApplicationRecord
  has_many :beds, through: :crops
end
