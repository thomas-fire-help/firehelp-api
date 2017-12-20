class AddTokenExpiresAtToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :token_expires_at, :datetime
  end
end
