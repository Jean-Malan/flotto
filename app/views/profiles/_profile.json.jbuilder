json.extract! profile, :id, :company, :username, :first_name, :last_name, :address, :city, :country, :post_code, :created_at, :updated_at
json.url profile_url(profile, format: :json)
