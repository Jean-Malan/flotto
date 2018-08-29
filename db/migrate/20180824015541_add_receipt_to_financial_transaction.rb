class AddReceiptToFinancialTransaction < ActiveRecord::Migration[5.0]
  def change
    add_column :financial_transactions, :receipt, :boolean
  end
end
