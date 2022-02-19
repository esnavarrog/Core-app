class AddStatusToGirls < ActiveRecord::Migration[6.1]
  def change
    add_column :girls, :status, :integer
  end
end
