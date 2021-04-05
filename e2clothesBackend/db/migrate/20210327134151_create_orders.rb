class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.bigint :user_id, null: false
      t.string :state, null: false

      t.timestamps
    end
    add_foreign_key :orders, :users, column: :user_id
  end
end
