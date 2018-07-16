class CreatePurchaseEntries < ActiveRecord::Migration
  def change
    create_table :purchase_entries do |t|
      t.integer :product_id
      t.string :description
      t.integer :account_id
      t.float :quantity
      t.float :price
      t.integer :total_price
      t.integer :purchase_id
      t.integer :user_id
      t.integer :gl_account_id
      t.integer :vat_type, default: 0
      t.float :vat_amount
      t.float :net_price

      t.timestamps null: false
    end
  end
end
