class ModelBase < ApplicationRecord
  def tonne_to_kilogram(data)
    data * 1000
  end

  def kilogram_to_tonne(data)
    data / 1000
  end
end