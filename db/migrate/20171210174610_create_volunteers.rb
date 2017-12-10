class CreateVolunteers < ActiveRecord::Migration[5.1]
  def change
    create_table :volunteers do |t|
      t.text :skills
      t.integer :number_of_volunteers
      t.text :volunteers_notes
      t.string :organization
      t.string :address
      t.string :coordinates
      t.string :contact_name
      t.string :phone_number
      t.string :email_address
      t.string :additional_information
      t.integer :user_id
      t.string :status, default: "available"
      t.boolean :verified, default: false

      t.timestamps
    end
  end
end
