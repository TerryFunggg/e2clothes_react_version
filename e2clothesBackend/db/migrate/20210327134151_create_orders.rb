class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.bigint :user_id, null: false
      t.string :state, null: false
      t.string :name, null: false
      t.string :city, null: false
      t.string :street_address, null: false
      t.string :building_address, null: false
      t.string :zip_code, null: false
      t.string :phone, null: false
      t.string :email, null: false
      t.string :code

      t.timestamps
    end
    add_foreign_key :orders, :users, column: :user_id
  end
end
