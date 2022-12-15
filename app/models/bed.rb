class Bed < ApplicationRecord
  belongs_to :garden
  has_many :crops
end
