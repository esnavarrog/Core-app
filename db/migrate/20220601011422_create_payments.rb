class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.string :description
      t.integer :amount
      t.datetime :pay_date
      t.integer :user_id
      t.integer :payment_method_id
      t.boolean :verified
      t.string :tbk_transaction_id
      t.string :tbk_token
      t.string :state
      t.string :webpay_data

      t.timestamps
    end
  end
end
