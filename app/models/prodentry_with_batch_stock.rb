class ProdentryWithBatchStock < ApplicationRecord
  belongs_to :batch
  belongs_to :stock
  belongs_to :product_entry

  def stocks_attributes=(stock_hash)
    self.stock = Stock.find_or_create_by(stock_hash[0])
    self.batch = Batch.find_or_create_by(stock_hash[1])
  end
end
