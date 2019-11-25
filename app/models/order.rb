class Order < ApplicationRecord
  belongs_to :user
  has_many :dishes, through: :selections
end
