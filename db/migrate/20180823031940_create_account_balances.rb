class CreateAccountBalances < ActiveRecord::Migration[5.0]
  def change
    create_table :account_balances do |t|
      t.date :date
      t.integer :account_id
      t.string :reference
      t.integer :amount
      t.integer :user_id

      t.timestamps
    end
  end
end
