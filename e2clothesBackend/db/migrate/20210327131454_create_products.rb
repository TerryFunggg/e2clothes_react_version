class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.bigint :shop_id, null: false
      t.string :name, null: false
      t.string :price, null: false
      t.text :decription
      t.bigint :quality, default: 0
      t.string :category
      t.string :state

      t.timestamps
    end
    add_index :products, :name, unique: true
    add_foreign_key :products, :shops, column: :shop_id
  end
end
