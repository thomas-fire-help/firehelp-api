class AddCategoryToTag < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :category, :string
  end
end
