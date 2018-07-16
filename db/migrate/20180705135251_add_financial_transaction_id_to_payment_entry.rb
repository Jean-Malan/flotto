class AddFinancialTransactionIdToPaymentEntry < ActiveRecord::Migration
  def change
    add_column :payment_entries, :financial_transaction_id, :integer
  end
end
