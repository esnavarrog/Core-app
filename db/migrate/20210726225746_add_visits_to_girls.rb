class AddVisitsToGirls < ActiveRecord::Migration[6.1]
  def change
    add_column :girls, :visits_count, :integer
  end
end
