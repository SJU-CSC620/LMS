class RenameBookLogToBooklog < ActiveRecord::Migration[5.0]
  def change
    rename_table :BooksLog, :booklog
  end
end
