class AddParametersToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :nickname, :string
    add_column :users, :role, :integer, default: :user
    add_column :users, :status, :integer, default: :active
    add_column :users, :avatar, :string
    add_column :users, :name, :string
    add_column :users, :birthday, :datetime
    add_column :users, :term_and_conditions, :boolean
  end
end
