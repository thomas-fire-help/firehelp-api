class AddUserAttributes < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :username, :string
    remove_column :users, :email, :string
  end
end
