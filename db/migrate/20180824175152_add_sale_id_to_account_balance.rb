class AddSaleIdToAccountBalance < ActiveRecord::Migration[5.0]
  def change
    add_column :account_balances, :sale_id, :integer
  end
end
