class RemoveOrderUserColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :user_id, :bigint
  end
end
