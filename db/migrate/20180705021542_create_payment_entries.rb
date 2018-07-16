class CreatePaymentEntries < ActiveRecord::Migration
  def change
    create_table :payment_entries do |t|
      t.integer :transaction_id

      t.timestamps null: false
    end
  end
end
