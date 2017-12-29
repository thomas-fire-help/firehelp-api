class RemoveChildrenFromHousing < ActiveRecord::Migration[5.1]
  def change
    remove_column :housings, :child_friendly, :boolean
    remove_column :housings, :kid_notes, :string
  end
end
