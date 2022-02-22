class Batch < ApplicationRecord
  has_many :prodentry_with_batch_stock
  has_many :product_entry, through: :prodentry_with_batch_stock

  has_many :stock, through: :prodentry_with_batch_stock

  validates :name, presence: true
  validates :weight, presence: true
  validates :meditate_unit, presence: true
end
