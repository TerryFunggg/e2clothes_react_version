class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|
      t.references :order_log, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
