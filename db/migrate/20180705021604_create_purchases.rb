class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :invoice_number
      t.integer :contact_id
      t.date :date
      t.text :notes
      t.integer :purchases_type
      t.integer :user_id
      t.float :amount
      t.integer :puchase_id
      t.float :balance
      t.float :vat_amount

      t.timestamps null: false
    end
  end
end
