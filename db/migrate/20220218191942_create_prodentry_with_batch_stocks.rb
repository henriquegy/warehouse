class CreateProdentryWithBatchStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :prodentry_with_batch_stocks do |t|
      t.integer :product_entry_id
      t.integer :batch_id
      t.integer :stock_id

      t.timestamps
    end
  end
end
