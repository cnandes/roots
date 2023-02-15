class VeggieTip < ApplicationRecord
  belongs_to :veggie

  validates :tip, presence: true
end
