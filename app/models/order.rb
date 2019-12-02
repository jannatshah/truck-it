class Order < ApplicationRecord
  belongs_to :user
  has_many :dishes, through: :selections
  has_many :selections, dependent: :destroy
  monetize :amount_cents
end
