class AddUserIdToPaymentEntry < ActiveRecord::Migration
  def change
    add_column :payment_entries, :user_id, :integer
  end
end
