class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.bigint :order_log_id, null: false
      t.bigint :user_id, null: false
      t.string :state, null: false

      t.timestamps
    end
  end
end
