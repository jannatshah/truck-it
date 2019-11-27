class Diet < ApplicationRecord
  has_many :dish_diets
  has_many :dishes, through: :dish_diets
  validates :requirement, uniqueness: true, presence: true
end
