class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :userName, null: false
      t.string :firstName, null: false
      t.string :lastName
      t.string :email, null: false
      t.string :password, null: false
      t.string :avatar
      t.string :phone, null: false
      t.boolean :isActive, null: false
      t.string :role, null: false
      t.bigint :address_id

      t.timestamps
    end
    add_index :users, %i[email], unique: true
    add_foreign_key :users, :addresses, column: :address_id
  end
end
