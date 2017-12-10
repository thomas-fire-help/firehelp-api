class CreateHousings < ActiveRecord::Migration[5.1]
  def change
    create_table :housings do |t|
      t.string :city
      t.integer :beds
      t.string :length_of_stay
      t.boolean :child_friendly
      t.text :kid_notes
      t.boolean :pets_accepted
      t.text :pet_notes
      t.string :contact_name
      t.string :phone_number
      t.string :email_address
      t.text :notes
      t.integer :user_id
      t.string :status
      t.boolean :verified

      t.timestamps
    end
  end
end
