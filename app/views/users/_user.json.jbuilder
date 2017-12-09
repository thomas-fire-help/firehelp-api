json.extract! user, :id, :phone_number, :password_digest, :username, :created_at, :updated_at
json.url user_url(user, format: :json)
