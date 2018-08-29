class AddAccountBalanceIdToPurchaseEntry < ActiveRecord::Migration[5.0]
  def change
    add_column :purchase_entries, :account_balance_id, :integer
  end
end
