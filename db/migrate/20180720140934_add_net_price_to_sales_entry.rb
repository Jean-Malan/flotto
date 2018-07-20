class AddNetPriceToSalesEntry < ActiveRecord::Migration
  def change
    add_column :sales_entries, :net_price, :float
  end
end
