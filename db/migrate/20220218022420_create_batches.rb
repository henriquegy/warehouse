class CreateBatches < ActiveRecord::Migration[5.2]
  def change
    create_table :batches do |t|
      t.text :name
      t.float :weight
      t.text :meditate_unit

      t.timestamps
    end
  end
end
