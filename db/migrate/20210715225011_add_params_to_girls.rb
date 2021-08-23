class AddParamsToGirls < ActiveRecord::Migration[6.1]
  def change
    add_column :girls, :name, :string
    add_column :girls, :price, :integer
    add_column :girls, :description, :text
    add_column :girls, :body, :string
    add_column :girls, :address, :string
    add_column :girls, :horario, :string
    add_column :girls, :idioma, :string
    add_column :girls, :depilacion, :string
    add_column :girls, :cabello, :string
    add_column :girls, :ojos, :string
    add_column :girls, :kilos, :integer
    add_column :girls, :phone, :string
    add_column :girls, :ubicacion, :string
    add_column :girls, :nacionalidad, :string
    add_column :girls, :edad, :integer
    add_column :girls, :estatura, :string
    add_column :girls, :garganta, :string
    add_column :girls, :colita, :string
    add_column :girls, :americana, :string
    add_column :girls, :caricias, :string
    add_column :girls, :contactos, :string
    add_column :girls, :media, :string
    add_column :girls, :polola, :string
    add_column :girls, :oral, :string
    add_column :girls, :fantasias, :string
    add_column :girls, :adicionales, :string
    add_column :girls, :certificada, :string
  end
end
