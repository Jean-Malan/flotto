json.extract! contact, :id, :name, :address_one, :address_two, :city, :state, :zipcode, :phone, :website, :user_id, :sale_id, :purchase_id, :transaction_id, :email, :created_at, :updated_at
json.url contact_url(contact, format: :json)
