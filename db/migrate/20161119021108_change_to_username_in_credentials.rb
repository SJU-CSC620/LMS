class ChangeToUsernameInCredentials < ActiveRecord::Migration[5.0]
  def change
    rename_column :credentials, :email, :username
  end
end
