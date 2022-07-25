class AddStateMessageToPayment < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :status_message, :string
  end
end
