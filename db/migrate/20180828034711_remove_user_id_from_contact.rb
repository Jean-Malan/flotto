class RemoveUserIdFromContact < ActiveRecord::Migration[5.0]
  def change
    remove_column :contacts, :user_id, :string
  end
end
