class CreateUploads < ActiveRecord::Migration[5.1]
  def change
    create_table :uploads do |t|
      t.string :key
      t.integer :uploadable_id
      t.string :uploadable_type

      t.timestamps
    end
  end
end
