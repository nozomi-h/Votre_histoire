# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_25_032215) do

  create_table "addresses", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_kana_name", null: false
    t.string "last_kana_name", null: false
    t.string "tel_number", null: false
    t.string "postal_code", null: false
    t.string "prefecture", null: false
    t.string "city_address", null: false
    t.string "building", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "delivery_last_name"
    t.string "delivery_first_name"
    t.string "delivery_last_kana_name"
    t.string "delivery_first_kane_name"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "arrivals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "arrival_count", default: 0, null: false
    t.integer "item_id"
    t.date "arrival_date"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "item_id"
    t.integer "address_id"
    t.integer "amount", null: false
    t.string "purchase_price"
    t.string "payment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_color_id"
    t.integer "item_color_size_id"
  end

  create_table "colors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "color", default: 0, null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_color_sizes", force: :cascade do |t|
    t.integer "item_color_id"
    t.integer "size_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_colors", force: :cascade do |t|
    t.integer "item_id"
    t.integer "color_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "prodct_name", null: false
    t.string "image_id"
    t.string "material", null: false
    t.integer "price", null: false
    t.integer "status", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "genre"
    t.integer "amount"
  end

  create_table "order_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_id"
    t.integer "amount"
    t.integer "order_id"
    t.integer "total_price"
    t.datetime "deleted_at"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "address_id", null: false
    t.string "purchase_price", null: false
    t.string "payment", null: false
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "postage"
    t.string "order_number"
    t.string "delivery_last_name"
    t.string "delivery_first_name"
    t.string "delivery_last_kana_name"
    t.string "delivery_first_kana_name"
    t.datetime "deleted_at"
  end

  create_table "sizes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "size", default: 0, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "first_kana_name"
    t.string "last_kana_name"
    t.string "tel_number"
    t.string "postal_code"
    t.string "prefecture"
    t.string "city_address"
    t.string "building"
    t.date "birth_day"
    t.integer "sex"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
