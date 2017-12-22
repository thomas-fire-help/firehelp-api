class AddInfoToHousing < ActiveRecord::Migration[5.1]
  def change
    add_column :housings, :paid, :boolean
    add_column :housings, :neighborhood, :string
    add_column :housings, :housing_type, :string
    add_column :housings, :has_animals, :boolean
  end
end
