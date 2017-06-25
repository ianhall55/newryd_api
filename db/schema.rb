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

ActiveRecord::Schema.define(version: 20170621033016) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "car_histories", force: :cascade do |t|
    t.integer  "user_id",                       null: false
    t.integer  "car_id",                        null: false
    t.datetime "rental_start",                  null: false
    t.datetime "rental_finish"
    t.boolean  "current",       default: false, null: false
    t.index ["car_id"], name: "index_car_histories_on_car_id", using: :btree
    t.index ["user_id"], name: "index_car_histories_on_user_id", using: :btree
  end

  create_table "car_rentals", force: :cascade do |t|
    t.integer  "user_id",           null: false
    t.integer  "car_id"
    t.string   "status",            null: false
    t.integer  "type_id",           null: false
    t.integer  "price_tier_id",     null: false
    t.datetime "rental_start_date", null: false
    t.index ["car_id"], name: "index_car_rentals_on_car_id", using: :btree
    t.index ["user_id"], name: "index_car_rentals_on_user_id", using: :btree
  end

  create_table "cars", force: :cascade do |t|
    t.string  "make",          null: false
    t.string  "model",         null: false
    t.string  "vin",           null: false
    t.string  "year",          null: false
    t.string  "color",         null: false
    t.string  "license_plate", null: false
    t.integer "mileage",       null: false
    t.integer "type_id",       null: false
    t.index ["type_id"], name: "index_cars_on_type_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.string  "street",       null: false
    t.string  "city",         null: false
    t.string  "state",        null: false
    t.string  "zipcode",      null: false
    t.string  "name"
    t.string  "instructions"
    t.integer "user_id",      null: false
  end

  create_table "price_tiers", force: :cascade do |t|
    t.string  "description"
    t.decimal "start_price", null: false
    t.decimal "end_price",   null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name",        null: false
    t.string "description", null: false
    t.index ["name"], name: "index_types_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "phone_number",    null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "session_token"
    t.string   "user_type",       null: false
    t.integer  "car_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email", "password_digest"], name: "index_users_on_email_and_password_digest", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["phone_number", "password_digest"], name: "index_users_on_phone_number_and_password_digest", unique: true, using: :btree
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true, using: :btree
    t.index ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
  end

end
