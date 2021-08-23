class CreateGirls < ActiveRecord::Migration[6.1]
  def change
    create_table :girls do |t|

      t.timestamps
    end
  end
end
