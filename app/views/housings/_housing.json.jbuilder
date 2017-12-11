json.extract! housing, :id,
                       :city,
                       :beds,
                       :paid,
                       :neighborhood,
                       :housing_type,
                       :has_animals,
                       :length_of_stay,
                       :child_friendly,
                       :kid_notes,
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
json.uploads housing.uploads do |upload|
  json.id upload.id
  json.url upload.url('housing')
end
json.url housing_url(housing, format: :json)
