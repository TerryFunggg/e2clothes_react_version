class ChangeUseProductColumn < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:users, :is_active, true)
    change_column_default(:users, :role, 'buyer')
    remove_index(:products, :name)
  end
end
