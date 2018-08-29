class ChangeAmountToBeFloatInAccountBalance < ActiveRecord::Migration[5.0]
  def change
      change_column :account_balances, :amount, :float
  end
end
