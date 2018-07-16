class AddUserIdToGlAccount < ActiveRecord::Migration
  def change
    add_column :gl_accounts, :user_id, :integer
  end
end
