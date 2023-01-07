class Garden < ApplicationRecord
  belongs_to :user
  has_many :beds, dependent: :destroy

  validates :name, presence: true
end
