class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic: true, null: false
      t.integer :user
      t.text :message

      t.timestamps
    end
  end
end
