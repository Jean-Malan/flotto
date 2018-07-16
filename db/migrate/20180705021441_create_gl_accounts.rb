class CreateGlAccounts < ActiveRecord::Migration
  def change
    create_table :gl_accounts do |t|
      t.integer :code
      t.string :name
      t.integer :account_type

      t.timestamps null: false
    end
  end
end
