class AddPassowdDigestToCredential < ActiveRecord::Migration[5.0]
  def change
    add_column :credentials, :password_digest, :string
  end
end
