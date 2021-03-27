class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.bigint :user_id, null: false

      t.timestamps
    end
    add_index :carts, :user_id, unique: true
    add_foreign_key :carts, :users, column: :user_id
  end
end
