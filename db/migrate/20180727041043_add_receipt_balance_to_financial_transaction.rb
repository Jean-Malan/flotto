class AddReceiptBalanceToFinancialTransaction < ActiveRecord::Migration
  def change
    add_column :financial_transactions, :receipt_balance, :float
  end
end
