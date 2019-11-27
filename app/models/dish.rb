class Dish < ApplicationRecord
  belongs_to :truck
  has_many :orders, through: :selections
  has_many :diets, through: :dish_diets
  # Enables monetize (money rails)
  monetize :price_cents
end
