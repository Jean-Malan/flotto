class AddUserIdToReceiptEntry < ActiveRecord::Migration
  def change
    add_column :receipt_entries, :user_id, :integer
  end
end
