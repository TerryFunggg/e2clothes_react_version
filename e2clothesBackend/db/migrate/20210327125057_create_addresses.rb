class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :city, null: false
      t.string :streetAddress, null: false
      t.string :buildingAddress, null: false
      t.string :zipCode, null: false

      t.timestamps
    end
  end
end
