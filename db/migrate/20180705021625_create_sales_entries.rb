class CreateSalesEntries < ActiveRecord::Migration
  def change
    create_table :sales_entries do |t|
      t.integer :product_id
      t.string :description
      t.float :quantity
      t.float :price
      t.integer :vat_type, default: 0
      t.integer :account_id
      t.integer :total_price
      t.integer :sale_id
      t.integer :gl_account_id
      t.float :vat_amount

      t.timestamps null: false
    end
  end
end
