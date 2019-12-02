class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :selections, through: :orders
  # has_many :selections, dependent: :destroy
  has_one :truck
  monetize :amount_cents
end
