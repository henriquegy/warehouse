class StockWithBatch < ApplicationRecord  
  belongs_to :batch
  belongs_to :stock
end
