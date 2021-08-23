class ChangePriceToGirls < ActiveRecord::Migration[6.1]
  def change
    rename_column :girls, :price, :integer
  end
end
