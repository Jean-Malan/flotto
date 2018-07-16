json.extract! product, :id, :name, :brand, :tag, :price, :quantity, :purchase_entry_id, :sale_entry_id, :opening_stock, :current_stock, :user_id, :code, :created_at, :updated_at
json.url product_url(product, format: :json)
