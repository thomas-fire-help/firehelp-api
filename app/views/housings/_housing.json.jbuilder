json.extract! housing, :id,
                       :city,
                       :beds,
                       :paid,
                       :price,
                       :neighborhood,
                       :housing_type,
                       :has_animals,
                       :length_of_stay,
                       :pets_accepted,
                       :pet_notes,
                       :contact_name,
                       :phone_number,
                       :email_address,
                       :notes,
                       :user_id,
                       :status,
                       :verified,
                       :created_at,
                       :updated_at
json.tags housing.tags do |tag|
  json.id tag.id
  json.name tag.name
end
json.url housing_url(housing, format: :json)
