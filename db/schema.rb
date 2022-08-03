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

ActiveRecord::Schema[7.0].define(version: 2022_08_02_172705) do
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
    t.text "notes"
    t.string "meeting_link"
    t.string "creator"
    t.text "attendees"
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

  create_table "shutdown_statuses", force: :cascade do |t|
    t.boolean "complete", default: false
    t.date "created_at", null: false
    t.integer "week_number"
    t.integer "week_year"
    t.integer "week_day"
    t.index ["week_number", "week_year", "week_day"], name: "idx_shutdown_statuses_on_day_and_week", unique: true
  end

  create_table "weekly_notes", force: :cascade do |t|
    t.text "notes"
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "blocks", default: "[]"
    t.integer "week_number"
    t.integer "week_year"
    t.index ["start_date", "end_date"], name: "index_weekly_notes_on_start_date_and_end_date", unique: true
    t.index ["week_year", "week_number"], name: "index_weekly_notes_on_week_year_and_week_number", unique: true
  end

  add_foreign_key "recurring_events", "events"
end
