class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.bigint :address_id, null: false
      t.bigint :user_id, null: false
      t.string :logo
      t.string :title, null: false
      t.string :slug
      t.string :description
      t.string :state, null: false

      t.timestamps
    end
    add_index :shops, %i[user_id title], unique: true
    add_foreign_key :shops, :users, column: :user_id
    add_foreign_key :shops, :addresses, column: :address_id
  end
end
