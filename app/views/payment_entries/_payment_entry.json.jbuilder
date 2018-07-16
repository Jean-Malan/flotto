json.extract! payment_entry, :id, :transaction_id, :created_at, :updated_at
json.url payment_entry_url(payment_entry, format: :json)
