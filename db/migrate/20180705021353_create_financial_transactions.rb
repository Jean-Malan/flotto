class CreateFinancialTransactions < ActiveRecord::Migration
  def change
    create_table :financial_transactions do |t|
      t.date :date
      t.string :description
      t.string :reference
      t.integer :project_id
      t.integer :contact_id
      t.float :vat_amount
      t.integer :transaction_type, default: 0
      t.integer :payment_entry_id
      t.boolean :payment
      t.integer :receipt_entry_id
      t.integer :gl_account_id
      t.integer :vat_type, default: 0
      t.integer :bank_account_id
      t.float :total_amount
      t.integer :purchase_id
      t.integer :sale_id
      t.float :net_amount

      t.timestamps null: false
    end
  end
end
