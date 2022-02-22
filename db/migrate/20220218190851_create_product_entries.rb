class CreateProductEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :product_entries do |t|
      t.float :weight
      t.text :meditate_unit

      t.timestamps
    end
  end
end
