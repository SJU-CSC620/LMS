class CreateCredentials < ActiveRecord::Migration[5.0]
  def change
    create_table :credentials do |t|
      t.string :loginId
      t.string :password
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
