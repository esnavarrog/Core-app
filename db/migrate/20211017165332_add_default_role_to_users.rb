class AddDefaultRoleToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :role, :integer, default: 0
    change_column :users, :status, :integer, default: 0
  end
end
