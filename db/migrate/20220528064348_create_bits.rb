class CreateBits < ActiveRecord::Migration[6.1]
  def change
    create_table :bits do |t|
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :price_pay

      t.timestamps
    end
  end
end
