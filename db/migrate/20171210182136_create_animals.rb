class CreateAnimals < ActiveRecord::Migration[5.1]
  def change
    create_table :animals do |t|
      t.string :type_of_animal
      t.text :help_offered
      t.string :city
      t.string :organization
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
