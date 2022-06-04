class AddParamsToPayments < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :buy_order, :integer
    add_column :payments, :session_id, :integer
  end
end
