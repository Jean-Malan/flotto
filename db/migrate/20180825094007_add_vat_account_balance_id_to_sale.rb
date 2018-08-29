class AddVatAccountBalanceIdToSale < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :vat_account_balance_id, :integer
  end
end
