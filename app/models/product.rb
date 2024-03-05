class Product < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_one_attached :photo
  validates :title, :description, :stock, :price, presence: true

  include PgSearch::Model
  pg_search_scope :search,
  against: %i[ title description brand pet category ],
    associated_against: {
    user: [ :first_name, :last_name ]
  },
  using: {
    tsearch: { prefix: true }
  }
end
