class AddVatAccountBalanceIdToPurchaseEntry < ActiveRecord::Migration[5.0]
  def change
    add_column :purchase_entries, :vat_account_balance_id, :integer
  end
end
