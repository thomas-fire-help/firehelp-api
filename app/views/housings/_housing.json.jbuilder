json.extract! housing, :id, :city, :beds, :length_of_stay, :child_friendly, :kid_notes, :pets_accepted, :pet_notes, :contact_name, :phone_number, :email_address, :notes, :user_id, :status, :verified, :created_at, :updated_at
json.url housing_url(housing, format: :json)
