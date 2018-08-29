class AddSalesEntryIdToAccountBalance < ActiveRecord::Migration[5.0]
  def change
    add_column :account_balances, :sales_entry_id, :integer
  end
end
