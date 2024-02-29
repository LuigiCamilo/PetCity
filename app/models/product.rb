class Product < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_one_attached :photo
  validates :photo, :title, :description, :stock, :price, presence: true
end
