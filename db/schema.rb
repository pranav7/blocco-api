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

ActiveRecord::Schema[7.0].define(version: 2022_04_19_113215) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "start"
    t.datetime "end"
    t.integer "event_type", default: 0
    t.integer "status", default: 0
    t.boolean "editable", default: true
    t.boolean "all_day", default: false
    t.string "color"
    t.string "background_color"
    t.string "border_color"
    t.string "text_color"
    t.string "google_event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["google_event_id"], name: "index_events_on_google_event_id", unique: true
  end

  create_table "recurring_events", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.string "start_time"
    t.string "end_time"
    t.datetime "start_recur"
    t.datetime "end_recur"
    t.string "days_of_week"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_recurring_events_on_event_id"
  end

  add_foreign_key "recurring_events", "events"
end
