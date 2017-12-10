class CreateTagTagabbles < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_taggables do |t|
      t.integer :taggable_id
      t.string :taggable_type
      t.integer :tag_id

      t.timestamps
    end
  end
end
