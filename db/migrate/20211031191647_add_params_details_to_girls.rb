class AddParamsDetailsToGirls < ActiveRecord::Migration[6.1]
  def change
    add_column :girls, :busto, :string
    add_column :girls, :cintura, :string
    add_column :girls, :cadera, :string
    add_column :girls, :pagos, :integer
    add_column :girls, :modalidad, :string
  end
end
