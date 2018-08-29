class AddJournalEntryIdToAccountBalance < ActiveRecord::Migration[5.0]
  def change
    add_column :account_balances, :journal_entry_id, :integer
  end
end
