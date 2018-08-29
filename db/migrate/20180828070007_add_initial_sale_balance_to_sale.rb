class AddInitialSaleBalanceToSale < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :initial_sale_balance, :float
  end
end
