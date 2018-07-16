class AddFinancialTransactionIdToReceiptEntry < ActiveRecord::Migration
  def change
    add_column :receipt_entries, :financial_transaction_id, :integer
  end
end
