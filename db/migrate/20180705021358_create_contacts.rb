class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :state
      t.string :zipcode
      t.integer :phone
      t.string :website
      t.string :user_id
      t.string :sale_id
      t.string :purchase_id
      t.string :transaction_id
      t.string :email

      t.timestamps null: false
    end
  end
end
