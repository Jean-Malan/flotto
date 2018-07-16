json.extract! purchase_entry, :id, :product_id, :description, :account_id, :quantity, :price, :total_price, :purchase_id, :user_id, :gl_account_id, :vat_type, :vat_amount, :net_price, :created_at, :updated_at
json.url purchase_entry_url(purchase_entry, format: :json)
