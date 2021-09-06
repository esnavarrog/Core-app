class AddPortadaToGirls < ActiveRecord::Migration[6.1]
  def change
    add_column :girls, :portada, :string
  end
end
