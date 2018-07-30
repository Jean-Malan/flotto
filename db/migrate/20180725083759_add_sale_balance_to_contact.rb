class AddSaleBalanceToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :sale_balance, :float
  end
end
