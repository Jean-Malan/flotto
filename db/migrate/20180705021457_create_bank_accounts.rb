class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.integer :code
      t.string :name
      t.float :opening_balance

      t.timestamps null: false
    end
  end
end
