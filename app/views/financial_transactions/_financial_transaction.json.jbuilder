json.extract! financial_transaction, :id, :date, :description, :reference, :project_id, :, :contact_id, :vat_amount, :transaction_type, :payment_entry_id, :payment, :receipt_entry_id, :gl_account_id, :vat_type, :bank_account_id, :total_amount, :purchase_id, :sale_id, :net_amount, :created_at, :updated_at
json.url financial_transaction_url(financial_transaction, format: :json)
