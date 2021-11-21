class Product < ApplicationRecord
  has_one_attached :photo

  validates :code, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true
end
