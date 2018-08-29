json.extract! vat_account_balance, :id, :date, :gl_account_id, :reference, :description, :vat_amount, :user_id, :sales_entry_id, :purchase_entry_id, :journal_entry_id, :sale_id, :purchase_id, :financial_transaction_id, :created_at, :updated_at
json.url vat_account_balance_url(vat_account_balance, format: :json)
