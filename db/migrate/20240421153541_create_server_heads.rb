class CreateServerHeads < ActiveRecord::Migration[7.1]
  def change
    create_table :server_heads do |t|
      t.string :banner

      t.timestamps
    end
  end
end
