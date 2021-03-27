class CreateTraffics < ActiveRecord::Migration[6.1]
  def change
    create_table :traffics do |t|
      t.bigint :user_id
      t.bigint :product_id

      t.timestamps
    end
    add_foreign_key :traffics, :users, column: :user_id
    add_foreign_key :traffics, :products, column: :product_id
  end
end
