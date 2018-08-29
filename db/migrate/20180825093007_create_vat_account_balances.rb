class CreateVatAccountBalances < ActiveRecord::Migration[5.0]
  def change
    create_table :vat_account_balances do |t|
      t.date :date
      t.integer :gl_account_id
      t.string :reference
      t.string :description
      t.float :vat_amount
      t.integer :user_id
      t.integer :sales_entry_id
      t.integer :purchase_entry_id
      t.integer :journal_entry_id
      t.integer :sale_id
      t.integer :purchase_id
      t.integer :financial_transaction_id

      t.timestamps
    end
  end
end
