json.extract! purchase, :id, :invoice_number, :contact_id, :date, :notes, :purchases_type, :user_id, :amount, :puchase_id, :balance, :vat_amount, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)
