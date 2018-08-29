class AddPurchaseIdToAccountBalance < ActiveRecord::Migration[5.0]
  def change
    add_column :account_balances, :purchase_id, :integer
  end
end
