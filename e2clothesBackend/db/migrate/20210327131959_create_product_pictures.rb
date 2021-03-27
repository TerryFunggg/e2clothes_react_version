class CreateProductPictures < ActiveRecord::Migration[6.1]
  def change
    create_table :product_pictures do |t|
      t.bigint :product_id, null: false
      t.string :img, null: false
      t.bigint :index, null: false

      t.timestamps
    end
    add_foreign_key :product_pictures, :products, column: :product_id
  end
end
