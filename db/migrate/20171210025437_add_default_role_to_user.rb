class AddDefaultRoleToUser < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :role, :string, default: "user"
  end
end
