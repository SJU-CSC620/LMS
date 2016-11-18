class AddEmailToCredentials < ActiveRecord::Migration[5.0]
  def change
    add_column(:credentials, :email, :string)
  end
end
