class Diet < ApplicationRecord
  has_many :dish_diets, dependent: :destroy
  has_many :dishes, through: :dish_diets
  validates :requirement, uniqueness: true, presence: true
end
