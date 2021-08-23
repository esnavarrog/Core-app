class AddAvatarToGirls < ActiveRecord::Migration[6.1]
  def change
    add_column :girls, :avatar, :string
  end
end
