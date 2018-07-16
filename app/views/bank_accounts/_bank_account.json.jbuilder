json.extract! bank_account, :id, :code, :name, :opening_balance, :created_at, :updated_at
json.url bank_account_url(bank_account, format: :json)
