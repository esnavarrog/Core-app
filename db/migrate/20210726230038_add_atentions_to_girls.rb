class AddAtentionsToGirls < ActiveRecord::Migration[6.1]
  def change
    add_column :girls, :virtual, :boolean
    add_column :girls, :presencial, :boolean
    add_column :girls, :videollamadas, :boolean
    add_column :girls, :llamadas, :boolean
    add_column :girls, :chat, :boolean
  end
end
