class AddBalanceToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :purchase_balance, :float
    add_column :products, :sale_balance, :float
  end
end
