class AddAccountBalanceIdToJournalEntry < ActiveRecord::Migration[5.0]
  def change
    add_column :journal_entries, :account_balance_id, :integer
  end
end
