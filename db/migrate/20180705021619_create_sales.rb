class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :number
      t.string :title
      t.string :address
      t.date :date
      t.date :due_date
      t.float :vat_total
      t.float :amount
      t.text :notes
      t.integer :customer_id
      t.integer :type
      t.integer :user_id
      t.integer :sale_id
      t.integer :contact_id
      t.integer :sales_type
      t.integer :invoice_number
      t.float :balance

      t.timestamps null: false
    end
  end
end
