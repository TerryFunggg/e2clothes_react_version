class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.bigint :user_id, null: false
      t.bigint :product_id, null: false

      t.timestamps
    end
    add_foreign_key :carts, :users, column: :user_id
    add_foreign_key :carts, :products, column: :product_id
  end
end
