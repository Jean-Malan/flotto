class CreateCreditingNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :crediting_notes do |t|
      t.float :credit_amount
      t.integer :contact_id
      t.date :date
      t.integer :user_id
      t.integer :sale_id
      t.integer :purchase_id
      t.float :balance

      t.timestamps
    end
  end
end
