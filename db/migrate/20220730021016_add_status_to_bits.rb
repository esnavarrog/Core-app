class AddStatusToBits < ActiveRecord::Migration[6.1]
  def change
    add_column :bits, :status, :integer
  end
end
