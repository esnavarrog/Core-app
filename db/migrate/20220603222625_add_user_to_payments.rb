class AddUserToPayments < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :payments, :users
  end
end
