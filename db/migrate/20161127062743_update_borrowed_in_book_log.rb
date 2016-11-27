class UpdateBorrowedInBookLog < ActiveRecord::Migration[5.0]
  def change
    change_column_default :BooksLog, :borrowed, from: Time.now, to: false
  end
end
