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

ActiveRecord::Schema.define(version: 2022_07_22_030603) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bits", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.integer "price_pay"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_bits_on_post_id"
    t.index ["user_id"], name: "index_bits_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "commentable_type", null: false
    t.bigint "commentable_id", null: false
    t.integer "user"
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

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
    t.string "portada"
    t.string "busto"
    t.string "cintura"
    t.string "cadera"
    t.integer "pagos"
    t.string "modalidad"
    t.bigint "user_id"
    t.string "slug"
    t.integer "service_type", default: 0
    t.string "gallery"
    t.integer "status"
    t.index ["slug"], name: "index_girls_on_slug", unique: true
    t.index ["user_id"], name: "index_girls_on_user_id"
  end

  create_table "inscriptions", force: :cascade do |t|
    t.string "rut"
    t.string "name"
    t.date "date"
    t.datetime "hour"
    t.integer "amount"
    t.string "number_operation"
    t.text "commentary"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_inscriptions_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "description"
    t.integer "amount"
    t.datetime "pay_date"
    t.integer "user_id"
    t.integer "payment_method_id"
    t.boolean "verified"
    t.string "tbk_transaction_id"
    t.string "tbk_token"
    t.string "state"
    t.string "webpay_data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "buy_order"
    t.string "session_id"
    t.integer "bits"
    t.integer "bit_amount"
    t.text "response_json"
    t.string "flow_order"
    t.integer "status"
    t.string "currency"
    t.string "payer"
    t.string "media"
    t.integer "fee"
    t.integer "balance"
    t.datetime "transfer_date"
  end

  create_table "poly_likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "likeable_type", null: false
    t.bigint "likeable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "emoji"
    t.index ["likeable_type", "likeable_id"], name: "index_poly_likes_on_likeable"
    t.index ["user_id"], name: "index_poly_likes_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "img"
    t.bigint "girl_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "video"
    t.bigint "user_id"
    t.integer "price", default: 0
    t.string "duration"
    t.string "resolution"
    t.index ["girl_id"], name: "index_posts_on_girl_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nickname"
    t.integer "role", default: 0
    t.integer "status", default: 0
    t.string "avatar"
    t.string "name"
    t.datetime "birthday"
    t.boolean "term_and_conditions"
    t.string "slug"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "provider", limit: 50, default: "", null: false
    t.string "uid", limit: 500, default: "", null: false
    t.string "image"
    t.integer "bit", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bits", "posts"
  add_foreign_key "bits", "users"
  add_foreign_key "girls", "users"
  add_foreign_key "inscriptions", "users"
  add_foreign_key "payments", "users"
  add_foreign_key "poly_likes", "users"
  add_foreign_key "posts", "girls"
  add_foreign_key "posts", "users"
end
