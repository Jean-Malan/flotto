class AddPurchaseBalanceToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :purchase_balance, :float
  end
end
