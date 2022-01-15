class CreateInscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :inscriptions do |t|
      t.string :rut
      t.string :name
      t.date :date
      t.datetime :hour
      t.integer :amount
      t.string :number_operation
      t.text :commentary
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
