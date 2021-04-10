class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.string :first_name, null: false
      t.string :last_name
      t.string :email, null: false
      t.string :password, null: false
      t.string :avatar
      t.string :phone, null: false
      t.boolean :is_active, null: false
      t.string :role, null: false
      t.bigint :address_id

      t.timestamps
    end
    add_index :users, %i[user_name email phone], unique: true
    add_foreign_key :users, :addresses, column: :address_id
  end
end
