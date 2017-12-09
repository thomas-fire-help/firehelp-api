class UserAttributesChanges < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :reset_password_email_sent_at, :reset_password_sent_at
    add_column :users, :verified, :boolean, default: false
    add_column :users, :role, :string
  end
end
