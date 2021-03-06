class Dish < ApplicationRecord
  belongs_to :truck
  has_many :selections, dependent: :destroy
  has_many :orders, through: :selections
  has_many :dish_diets, dependent: :destroy
  has_many :diets, through: :dish_diets

  # Enables monetize (money rails)
  monetize :price_cents
  validates :name, presence: true, uniqueness: { scope: :truck }
  validates :description, length: { maximum: 140 }
  validates :price, presence: true, numericality: { other_than: 0 }
end
