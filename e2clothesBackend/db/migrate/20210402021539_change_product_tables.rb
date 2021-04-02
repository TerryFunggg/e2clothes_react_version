class ChangeProductTables < ActiveRecord::Migration[6.1]
  def change
    change_table :products do |t|
      t.remove :category
      t.rename :state, :is_active
      t.change :is_active, :boolean, null: false, default: true
    end
  end
end
