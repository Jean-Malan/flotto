class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.string :tag
      t.float :price
      t.float :quantity
      t.integer :purchase_entry_id
      t.integer :sale_entry_id
      t.float :opening_stock
      t.float :current_stock
      t.integer :user_id
      t.integer :code

      t.timestamps null: false
    end
  end
end
