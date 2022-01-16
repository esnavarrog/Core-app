class AddGalleryToGirls < ActiveRecord::Migration[6.1]
  def change
    add_column :girls, :gallery, :string
  end
end
