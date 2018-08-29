class AddGlAccountIdToAccountBalance < ActiveRecord::Migration[5.0]
  def change
    add_column :account_balances, :gl_account_id, :integer
  end
end
