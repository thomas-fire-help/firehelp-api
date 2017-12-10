class RemovePolymorphicFromTags < ActiveRecord::Migration[5.1]
  def change
    remove_column :tags, :taggable_id, :integer
    remove_column :tags, :taggable_type, :string
  end
end
