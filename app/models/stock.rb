class Stock < ApplicationRecord
  has_many :prodentry_with_batch_stock
  has_many :product_entry, through: :prodentry_with_batch_stock

  has_many :batch, through: :prodentry_with_batch_stock

  validates :name, presence: true
end
