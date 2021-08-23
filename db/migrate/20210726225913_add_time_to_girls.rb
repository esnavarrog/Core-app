class AddTimeToGirls < ActiveRecord::Migration[6.1]
  def change
    add_column :girls, :horaE, :integer
    add_column :girls, :horaS, :integer
    add_column :girls, :minutosE, :integer
    add_column :girls, :minutosS, :integer
  end
end
