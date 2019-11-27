class Truck < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :destroy
  has_many :dishes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: { minimum: 4, maximum: 20 }
  validates :description, length: { maximum: 140 }
  validates :category, presence: true, inclusion:
  { in:
    [
      'Chinese', 'Indian', 'Thai', 'Mexican', 'Lebanese', 'Italian', 'Kebabs',
      'Burgers', 'Hot dogs', 'Ice cream', 'Donuts', 'Pancakes', 'Brazilian', 'Tapas',
      'Caribbean', 'French', 'Greek', 'Turkish', 'Indonesian', 'Fries', 'Jamaican',
      'Ethiopian', 'Kosher', 'Levantine', 'Polish', 'Peruvian', 'Bratwurst', 'Malay',
      'Singaporean', 'Vietnamese', 'Korean BBQ', 'Corn Dogs', 'Fish & chips', 'Argentine'
    ] }

  has_one_attached :photo

  def avg_reviews
    return 0 if reviews.empty?

    reviews.pluck(:rating).sum / reviews.size
  end
end
