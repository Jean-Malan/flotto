json.extract! sale, :id, :number, :title, :address, :date, :due_date, :vat_total, :amount, :notes, :customer_id, :type, :user_id, :sale_id, :contact_id, :sales_type, :invoice_number, :balance, :created_at, :updated_at
json.url sale_url(sale, format: :json)
