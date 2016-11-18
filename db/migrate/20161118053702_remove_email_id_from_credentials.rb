class RemoveEmailIdFromCredentials < ActiveRecord::Migration[5.0]
  def change
    remove_column :credentials, :emailId
    remove_column :credentials, :created_at
    remove_column :credentials, :updated_at
    add_column(:credentials, :created_at, :datetime)
      add_column(:credentials, :updated_at, :datetime)
  end
end
