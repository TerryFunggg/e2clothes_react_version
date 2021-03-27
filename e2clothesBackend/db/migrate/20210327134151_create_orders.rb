class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.bigint :pre_order_id, null: false
      t.bigint :user_id, null: false
      t.string :state, null: false

      t.timestamps
    end
    add_index :orders, :pre_order_id, unique: true
    add_foreign_key :orders, :users, column: :user_id
    add_foreign_key :orders, :pre_orders, column: :pre_order_id
  end
end
