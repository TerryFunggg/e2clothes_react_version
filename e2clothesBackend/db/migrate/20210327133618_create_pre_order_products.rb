class CreatePreOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :pre_order_products do |t|
      t.bigint :product_id, null: false
      t.bigint :pre_order_id, null: false

      t.timestamps
    end
    add_foreign_key :pre_order_products, :pre_orders, column: :pre_order_id
    add_foreign_key :pre_order_products, :products, column: :product_id
  end
end
