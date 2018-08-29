class AddPurchaseEntryIdToAccountBalance < ActiveRecord::Migration[5.0]
  def change
    add_column :account_balances, :purchase_entry_id, :integer
  end
end
