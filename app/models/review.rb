class Review < ApplicationRecord
  belongs_to :truck
  belongs_to :user
  validates :rating, presence: true, inclusion:
  { in: [1, 2, 3, 4, 5] }, numericality:
  { only_integer: true }
end
