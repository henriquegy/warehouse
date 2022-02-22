class ProductEntry < ApplicationRecord
  # acts_as_token_authenticatable
  
  has_many :prodentry_with_batch_stock

  has_many :stock, through: :prodentry_with_batch_stock
  has_many :batch, through: :prodentry_with_batch_stock

  validates :weight, presence: true
  validates :meditate_unit, presence: true

  accepts_nested_attributes_for :prodentry_with_batch_stock, reject_if: :all_blank, allow_destroy: true

  def prodentry_with_batch_stocks_attributes=(array)
    stocks_attributes = array.delete("stocks_attributes")

    stocks_attributes.each do |stock|
      has_many_batches(stock)
    end
  end

  def has_many_batches(current_stock)
    batches_attributes = current_stock.delete("batches_attributes")

    ajust_pentry_weight(batches_attributes)

    batches_attributes.each do |batch|
      data_hash = eval "{\"stocks_attributes\"=>[#{current_stock}, #{batch}]}"
      prodentry_with_batch_stock.build(data_hash)
    end
  end

  def ajust_pentry_weight(pbatches_attributes)
    if self.meditate_unit == 'kilogramas'
      self.weight += tonne_to_kg(have_weight_tonne?(pbatches_attributes))
      self.weight += have_weight_kg?(pbatches_attributes)
    elsif self.meditate_unit == 'toneladas'
      self.weight += kg_to_tonne(have_weight_kg?(pbatches_attributes))
      self.weight += have_weight_tonne?(pbatches_attributes)
    end
  end

  def have_weight_kg?(pbatches_attributes)
    total_weight = 0.00
    
    pbatches_attributes.each do |batch|
      total_weight += batch["weight"].to_f if batch["meditate_unit"] == 'kilogramas'
    end

    total_weight.to_f
  end

  def have_weight_tonne?(pbatches_attributes)
    total_weight = 0.00
    
    pbatches_attributes.each do |batch|
      total_weight += batch["weight"].to_f if batch["meditate_unit"] == 'toneladas'
    end

    total_weight.to_f
  end

  def tonne_to_kg(weight)
    weight * 1000
  end

  def kg_to_tonne(weight)
    weight / 1000
  end
end
