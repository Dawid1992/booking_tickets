# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_21_145303) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "tickets_total"
    t.integer "tickets_sold", default: 0
    t.decimal "tickets_price"
    t.datetime "start_date", precision: 6
  end

  create_table "orders", force: :cascade do |t|
    t.integer "tickets_amount", null: false
    t.integer "status", default: 0
    t.datetime "expiration_time", precision: 6, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "order_value", precision: 5, default: "0"
    t.integer "event_id"
  end

  add_foreign_key "orders", "events", on_delete: :cascade
end
