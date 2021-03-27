class CreateRates < ActiveRecord::Migration[6.1]
  def change
    create_table :rates do |t|
      t.bigint :user_id, null: false
      t.bigint :product_id, null: false
      t.integer :rate, null: false

      t.timestamps
    end
    add_foreign_key :rates, :users, column: :user_id
    add_foreign_key :rates, :products, column: :product_id
  end
end
