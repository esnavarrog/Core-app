# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_27_003710) do

  create_table "girls", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "price"
    t.text "description"
    t.string "body"
    t.string "address"
    t.string "horario"
    t.string "idioma"
    t.string "depilacion"
    t.string "cabello"
    t.string "ojos"
    t.integer "kilos"
    t.string "phone"
    t.string "ubicacion"
    t.string "nacionalidad"
    t.integer "edad"
    t.string "estatura"
    t.string "garganta"
    t.string "colita"
    t.string "americana"
    t.string "caricias"
    t.string "contactos"
    t.string "media"
    t.string "polola"
    t.string "oral"
    t.string "fantasias"
    t.string "adicionales"
    t.string "certificada"
    t.string "avatar"
    t.integer "visits_count"
    t.integer "horaE"
    t.integer "horaS"
    t.integer "minutosE"
    t.integer "minutosS"
    t.boolean "virtual"
    t.boolean "presencial"
    t.boolean "videollamadas"
    t.boolean "llamadas"
    t.boolean "chat"
  end

end
