class Product < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_one_attached :photo
  validates :photo, presence: true
end
