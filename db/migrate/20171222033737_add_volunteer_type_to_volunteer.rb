class AddVolunteerTypeToVolunteer < ActiveRecord::Migration[5.1]
  def change
    add_column :volunteers, :volunteer_type, :string
    add_column :volunteers, :location, :string
  end
end
