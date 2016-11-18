class AddUserIdToCredentials < ActiveRecord::Migration[5.0]
  def change
    add_column :credentials, :user_id, :integer
  end
end
