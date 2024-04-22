class RemoveFieldNameFromTableName < ActiveRecord::Migration[7.1]
  def change
    remove_column :accounts, :password, :binary
  end
end
