class CreateShopStuffs < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_stuffs do |t|
      t.string :file, null: false
      t.bigint :shop_id, null: false

      t.timestamps
    end
    add_foreign_key :shop_stuffs, :shops, column: :shop_id
  end
end
