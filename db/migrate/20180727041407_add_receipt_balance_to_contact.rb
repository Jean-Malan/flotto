class AddReceiptBalanceToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :receipt_balance, :float
  end
end
