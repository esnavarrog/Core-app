class ChangeTypePriceGirlsAgain < ActiveRecord::Migration[6.1]
  def up
    change_table :girls do |t|
      t.change :price, :string
    end
  end

  def down
    change_table :girls do |t|
      t.change :price, :integer
    end
  end
end
