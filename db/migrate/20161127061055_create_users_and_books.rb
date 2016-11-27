class CreateUsersAndBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :BooksLog, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :book, index: true
      t.datetime :borrowed,  :null => false, :default => Time.now
      t.datetime :returned, :null => true
    end
  end
end
