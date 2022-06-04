class ChangeBuyOrderToPayments < ActiveRecord::Migration[6.1]
  def change
    change_column :payments, :buy_order, :string
  end
end
