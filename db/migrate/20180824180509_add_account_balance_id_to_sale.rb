class AddAccountBalanceIdToSale < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :account_balance_id, :integer
  end
end
