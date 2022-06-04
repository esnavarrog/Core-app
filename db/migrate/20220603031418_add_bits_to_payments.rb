class AddBitsToPayments < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :bits, :integer
  end
end
