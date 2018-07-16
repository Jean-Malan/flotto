class AddUserIdToSalesEntry < ActiveRecord::Migration
  def change
    add_column :sales_entries, :user_id, :integer
  end
end
