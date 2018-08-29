class AddVatAccountBalanceIdToJournalEntry < ActiveRecord::Migration[5.0]
  def change
    add_column :journal_entries, :vat_account_balance_id, :integer
  end
end
