class AddAfterBitToPayments < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :after_bit, :integer
  end
end
