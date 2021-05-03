class RenamePasswordInUser < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :password, :password_hash
  end
end
