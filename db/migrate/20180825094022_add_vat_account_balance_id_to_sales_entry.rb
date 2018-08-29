class AddVatAccountBalanceIdToSalesEntry < ActiveRecord::Migration[5.0]
  def change
    add_column :sales_entries, :vat_account_balance_id, :integer
  end
end
