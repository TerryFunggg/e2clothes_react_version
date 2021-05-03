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

ActiveRecord::Schema.define(version: 2021_05_03_135029) do

  create_table "addresses", charset: "utf8mb4", force: :cascade do |t|
    t.string "city", null: false
    t.string "streetAddress", null: false
    t.string "buildingAddress", null: false
    t.string "zipCode", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "carts", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "fk_rails_916f2a1419"
    t.index ["user_id"], name: "fk_rails_ea59a35211"
  end

  create_table "categories", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "product_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_products", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.string "price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "orders", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "state", null: false
    t.string "name", null: false
    t.string "city", null: false
    t.string "streetAddress", null: false
    t.string "buildingAddress", null: false
    t.string "zipCode", null: false
    t.string "phone", null: false
    t.string "email", null: false
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "fk_rails_f868b47f6a"
  end

  create_table "product_pictures", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "img", null: false
    t.bigint "index", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "fk_rails_58abff9e7b"
  end

  create_table "products", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "shop_id", null: false
    t.string "name", null: false
    t.string "price", null: false
    t.text "decription"
    t.bigint "quality", default: 0
    t.boolean "isActive", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "fk_rails_b169a26347"
  end

  create_table "rates", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.integer "rate", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "fk_rails_ff1b21d7f5"
    t.index ["user_id"], name: "fk_rails_4a29085ce0"
  end

  create_table "shop_stuffs", charset: "utf8mb4", force: :cascade do |t|
    t.string "file", null: false
    t.bigint "shop_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "fk_rails_7e2288f703"
  end

  create_table "shops", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "address_id", null: false
    t.bigint "user_id", null: false
    t.string "logo"
    t.string "title", null: false
    t.string "slug"
    t.string "description"
    t.string "state", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "fk_rails_a206706856"
    t.index ["user_id", "title"], name: "index_shops_on_user_id_and_title", unique: true
  end

  create_table "traffics", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "fk_rails_5ac7166f00"
    t.index ["user_id"], name: "fk_rails_7bcbca9704"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "userName", null: false
    t.string "firstName", null: false
    t.string "lastName"
    t.string "email", null: false
    t.string "password_hash", null: false
    t.string "avatar"
    t.string "phone", null: false
    t.boolean "isActive", default: true, null: false
    t.string "role", default: "buyer", null: false
    t.bigint "address_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "fk_rails_eb2fc738e4"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "carts", "products"
  add_foreign_key "carts", "users"
  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "product_pictures", "products"
  add_foreign_key "products", "shops"
  add_foreign_key "rates", "products"
  add_foreign_key "rates", "users"
  add_foreign_key "shop_stuffs", "shops"
  add_foreign_key "shops", "addresses"
  add_foreign_key "shops", "users"
  add_foreign_key "traffics", "products"
  add_foreign_key "traffics", "users"
  add_foreign_key "users", "addresses"
end
