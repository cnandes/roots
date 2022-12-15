class Garden < ApplicationRecord
  belongs_to :user
  has_many :beds
end
