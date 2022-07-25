class AddLastBitToPayments < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :last_bit_amount, :integer
  end
end
