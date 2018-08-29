class AddInitialPurchaseBalanceToPurchase < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :initial_purchase_balance, :float
  end
end
