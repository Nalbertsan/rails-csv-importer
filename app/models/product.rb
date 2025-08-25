class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :value, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock_amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
