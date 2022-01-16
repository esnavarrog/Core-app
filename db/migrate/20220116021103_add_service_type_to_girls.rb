class AddServiceTypeToGirls < ActiveRecord::Migration[6.1]
  def change
    add_column :girls, :service_type, :integer, :default => 0
  end
end
