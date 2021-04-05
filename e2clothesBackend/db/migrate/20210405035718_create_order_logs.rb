class CreateOrderLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :order_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :order_code

      t.timestamps
    end
  end
end
