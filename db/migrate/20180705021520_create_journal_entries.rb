class CreateJournalEntries < ActiveRecord::Migration
  def change
    create_table :journal_entries do |t|
      t.string :description
      t.float :amount
      t.integer :account_id
      t.boolean :debit
      t.boolean :credit
      t.date :date
      t.integer :user_id
      t.integer :journal_id
      t.integer :gl_account_id
      t.boolean :current_liability
      t.boolean :non_current_liability
      t.boolean :equity

      t.timestamps null: false
    end
  end
end
