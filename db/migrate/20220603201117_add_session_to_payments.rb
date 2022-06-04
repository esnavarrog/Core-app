class AddSessionToPayments < ActiveRecord::Migration[6.1]
  def change
    change_column :payments, :session_id, :string
  end
end
