json.extract! receipt_entry, :id, :transaction_id, :created_at, :updated_at
json.url receipt_entry_url(receipt_entry, format: :json)
