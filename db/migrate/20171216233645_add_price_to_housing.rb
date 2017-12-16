class AddPriceToHousing < ActiveRecord::Migration[5.1]
  def change
    add_column :housings, :price, :string
  end
end
