class RemoveAccountBalanceFromGlAccount < ActiveRecord::Migration[5.0]
  def change
    remove_column :gl_accounts, :account_balance, :integer
  end
end
