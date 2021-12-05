class AddUserToGirls < ActiveRecord::Migration[6.1]
  def change
    add_reference :girls, :user, foreign_key: true
  end
end
