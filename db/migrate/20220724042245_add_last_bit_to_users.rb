class AddLastBitToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :last_bit, :integer
  end
end
