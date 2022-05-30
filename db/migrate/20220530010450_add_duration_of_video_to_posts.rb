class AddDurationOfVideoToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :duration, :string
    add_column :posts, :resolution, :string
  end
end
