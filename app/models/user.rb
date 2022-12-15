class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :gardens
  has_many :beds, through: :gardens
  has_many :crops, through: :beds
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
