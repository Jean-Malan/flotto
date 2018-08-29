class AddVatAccountBalanceIdToFinancialTransaction < ActiveRecord::Migration[5.0]
  def change
    add_column :financial_transactions, :vat_account_balance_id, :integer
  end
end
