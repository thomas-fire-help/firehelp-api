json.extract! animal, :id, :type_of_animal, :help_offered, :city, :organization, :contact_name, :phone_number, :email_address, :additional_information, :user_id, :status, :verified, :created_at, :updated_at
json.tags animal.tags do |tag|
  json.id tag.id
  json.name tag.name
end
json.url animal_url(animal, format: :json)
