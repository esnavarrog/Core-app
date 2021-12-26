class AddEmojiToPolyLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :poly_likes, :emoji, :integer
  end
end
