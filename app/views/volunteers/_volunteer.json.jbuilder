json.extract! volunteer, :id,
                         :skills,
                         :number_of_volunteers,
                         :volunteers_notes,
                         :organization,
                         :address,
                         :coordinates,
                         :contact_name,
                         :phone_number,
                         :email_address,
                         :location,
                         :volunteer_type,
                         :additional_information,
                         :user_id,
                         :status,
                         :verified,
                         :created_at,
                         :updated_at
json.tags volunteer.tags do |tag|
  json.id tag.id
  json.name tag.name
end
json.url volunteer_url(volunteer, format: :json)
