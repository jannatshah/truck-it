class Truck < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :destroy
  has_many :dishes, dependent: :destroy
end
