class CreateReceiptEntries < ActiveRecord::Migration
  def change
    create_table :receipt_entries do |t|
      t.integer :transaction_id

      t.timestamps null: false
    end
  end
end
