class RemoveAccountBalanceFromFinancialTransaction < ActiveRecord::Migration[5.0]
  def change
    remove_column :financial_transactions, :account_balance, :integer
  end
end
