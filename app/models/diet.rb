class Diet < ApplicationRecord
  has_many :dishes, through: :dish_diets
end
