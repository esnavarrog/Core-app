class AddSlugToGirls < ActiveRecord::Migration[6.1]
  def change
    add_column :girls, :slug, :string
    add_index :girls, :slug, unique: true
  end
end
