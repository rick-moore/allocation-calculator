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

ActiveRecord::Schema.define(version: 2022_08_09_211644) do

  create_table "departure_warnings", force: :cascade do |t|
    t.integer "excursion_id"
    t.date "excursion_date"
    t.string "port_name"
    t.string "excursion_name"
    t.string "ship_code"
    t.float "percent_sold"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "departures", force: :cascade do |t|
    t.string "ship_code"
    t.date "date"
    t.string "port_name"
    t.integer "excursion_id"
    t.integer "maximum"
    t.integer "sold"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
