class AddAccountBalanceIdToSalesEntry < ActiveRecord::Migration[5.0]
  def change
    add_column :sales_entries, :account_balance_id, :integer
  end
end
