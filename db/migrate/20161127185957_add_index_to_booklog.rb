class AddIndexToBooklog < ActiveRecord::Migration[5.0]
  def change
    add_column :booklogs, :id, :primary_key
  end
end
