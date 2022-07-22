class AddJsonToPayment < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :response_json, :text
    add_column :payments, :flow_order, :string
    add_column :payments, :status, :integer
    add_column :payments, :currency, :string
    add_column :payments, :payer, :string
    add_column :payments, :media, :string
    add_column :payments, :fee, :integer
    add_column :payments, :balance, :integer
    add_column :payments, :transfer_date, :datetime
  end
end
