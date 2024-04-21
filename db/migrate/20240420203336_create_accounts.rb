class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.string :username
      t.binary :password
      t.string :email

      t.timestamps
    end
  end
end
