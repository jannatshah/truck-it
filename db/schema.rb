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

ActiveRecord::Schema.define(version: 2019_11_26_144627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.index ["truck_id"], name: "index_dishes_on_truck_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "day"
    t.time "start_time"
    t.time "end_time"
    t.string "location"
    t.boolean "open"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "dish_diets", "diets"
  add_foreign_key "dish_diets", "dishes"
  add_foreign_key "dishes", "trucks"
  add_foreign_key "orders", "users"
  add_foreign_key "schedules", "trucks"
  add_foreign_key "selections", "dishes"
  add_foreign_key "selections", "orders"
  add_foreign_key "trucks", "users"
end
