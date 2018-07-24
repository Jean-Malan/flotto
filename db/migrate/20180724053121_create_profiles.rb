class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :company
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :country
      t.string :post_code

      t.timestamps null: false
    end
  end
end
