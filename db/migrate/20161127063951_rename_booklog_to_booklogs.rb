class RenameBooklogToBooklogs < ActiveRecord::Migration[5.0]
  def change
    rename_table :booklog, :booklogs
  end
end
