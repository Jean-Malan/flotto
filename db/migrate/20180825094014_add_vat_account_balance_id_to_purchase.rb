class AddVatAccountBalanceIdToPurchase < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :vat_account_balance_id, :integer
  end
end
