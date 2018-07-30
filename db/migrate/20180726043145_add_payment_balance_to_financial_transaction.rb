class AddPaymentBalanceToFinancialTransaction < ActiveRecord::Migration
  def change
    add_column :financial_transactions, :payment_balance, :float
  end
end
