class ChangeTypePrice < ActiveRecord::Migration[6.1]
  def change

    rename_column :girls, :integer, :price
    def up
      change_table :girls do |t|
        t.change :price, :integer
      end
    end
  
    def down
      change_table :girls do |t|
        t.change :price, :string
      end
    end
  end
end
