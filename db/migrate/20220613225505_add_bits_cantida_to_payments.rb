class AddBitsCantidaToPayments < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :bit_amount, :integer
  end
end
