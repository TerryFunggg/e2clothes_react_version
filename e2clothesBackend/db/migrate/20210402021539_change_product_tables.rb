class ChangeProductTables < ActiveRecord::Migration[6.1]
  def change
    change_table :products do |t|
      t.remove :category
      t.rename :state, :isActive
      t.change :isActive, :boolean, null: false, default: true
    end
  end
end
