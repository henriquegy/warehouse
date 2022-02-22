class CreateStockWithBatches < ActiveRecord::Migration[5.2]
  def change
    create_table :stock_with_batches do |t|
      t.integer :stock_id
      t.integer :batch_id

      t.timestamps
    end
  end
end
