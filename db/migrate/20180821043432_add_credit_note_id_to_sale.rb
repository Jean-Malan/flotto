class AddCreditNoteIdToSale < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :credit_note_id, :integer
  end
end
