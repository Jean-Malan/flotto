class AddPaymentBalanceToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :payment_balance, :float
  end
end
