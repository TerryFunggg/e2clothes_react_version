class AddIndextoOrders < ActiveRecord::Migration[6.1]
  def change
    add_index :orders, :order_log_id, unique: true
    add_foreign_key :orders, :users, column: :user_id
    add_foreign_key :orders, :order_logs, column: :order_log_id
  end
end
