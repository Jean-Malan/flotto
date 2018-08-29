class AddFinancialTransactionIdToAccountBalance < ActiveRecord::Migration[5.0]
  def change
    add_column :account_balances, :financial_transaction_id, :integer
  end
end
