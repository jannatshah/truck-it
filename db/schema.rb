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

ActiveRecord::Schema.define(version: 2019_12_02_165014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "diets", force: :cascade do |t|
    t.string "requirement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dish_diets", force: :cascade do |t|
    t.bigint "dish_id"
    t.bigint "diet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diet_id"], name: "index_dish_diets_on_diet_id"
    t.index ["dish_id"], name: "index_dish_diets_on_dish_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "truck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.index ["truck_id"], name: "index_dishes_on_truck_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.string "checkout_session_id"
    t.integer "amount_cents", default: 0, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.bigint "truck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["truck_id"], name: "index_reviews_on_truck_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "day"
    t.time "start_time"
    t.time "end_time"
    t.string "location"
    t.bigint "truck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["truck_id"], name: "index_schedules_on_truck_id"
  end

  create_table "selections", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_selections_on_dish_id"
    t.index ["order_id"], name: "index_selections_on_order_id"
  end

  create_table "trucks", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "category"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "card", default: false
    t.index ["user_id"], name: "index_trucks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_type"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "dish_diets", "diets"
  add_foreign_key "dish_diets", "dishes"
  add_foreign_key "dishes", "trucks"
  add_foreign_key "orders", "users"
  add_foreign_key "reviews", "trucks"
  add_foreign_key "reviews", "users"
  add_foreign_key "schedules", "trucks"
  add_foreign_key "selections", "dishes"
  add_foreign_key "selections", "orders"
  add_foreign_key "trucks", "users"
end
