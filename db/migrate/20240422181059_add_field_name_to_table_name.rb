class AddFieldNameToTableName < ActiveRecord::Migration[7.1]
  def change
    add_column :accounts, :password_hash, :binary
  end
end
