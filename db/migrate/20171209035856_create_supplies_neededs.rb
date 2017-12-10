class CreateSuppliesNeededs < ActiveRecord::Migration[5.1]
  def change
    create_table :supplies_neededs do |t|
      t.string :organization
      t.string :drop_off_location
      t.string :phone_number
      t.string :drop_off_hours
      t.string :email_address
      t.string :direct_donations
      t.string :items
      t.string :special_instructions
      t.integer :user_id

      t.timestamps
    end
  end
end
