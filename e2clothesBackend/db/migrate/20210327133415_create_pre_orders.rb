class CreatePreOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :pre_orders do |t|
      t.bigint :user_id

      t.timestamps
    end
    add_foreign_key :pre_orders, :users, column: :user_id
  end
end
