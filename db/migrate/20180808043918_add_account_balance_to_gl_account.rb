class AddAccountBalanceToGlAccount < ActiveRecord::Migration
  def change
    add_column :gl_accounts, :account_balance, :float
  end
end
