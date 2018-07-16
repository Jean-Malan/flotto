class AddUserIdToFinancialTransaction < ActiveRecord::Migration
  def change
    add_column :financial_transactions, :user_id, :integer
  end
end
