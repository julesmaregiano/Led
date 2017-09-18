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

ActiveRecord::Schema.define(version: 20170918084249) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "housing_id"
    t.datetime "set_at"
    t.text "comment"
    t.datetime "confirmed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "diagnostic_id"
    t.index ["diagnostic_id"], name: "index_bookings_on_diagnostic_id"
    t.index ["housing_id"], name: "index_bookings_on_housing_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "diagnostics", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "housings", force: :cascade do |t|
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "points", force: :cascade do |t|
    t.bigint "zone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "lng"
    t.string "lat"
    t.index ["zone_id"], name: "index_points_on_zone_id"
  end

  create_table "survey_answers", force: :cascade do |t|
    t.integer "attempt_id"
    t.integer "question_id"
    t.integer "option_id"
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "option_text"
    t.integer "option_number"
    t.integer "predefined_value_id"
  end

  create_table "survey_attempts", force: :cascade do |t|
    t.string "participant_type"
    t.bigint "participant_id"
    t.integer "survey_id"
    t.boolean "winner"
    t.integer "score"
    t.index ["participant_type", "participant_id"], name: "index_survey_attempts_on_participant_type_and_participant_id"
  end

  create_table "survey_options", force: :cascade do |t|
    t.integer "question_id"
    t.integer "weight", default: 0
    t.string "text"
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "locale_text"
    t.integer "options_type_id"
    t.string "head_number"
  end

  create_table "survey_predefined_values", force: :cascade do |t|
    t.string "head_number"
    t.string "name"
    t.string "locale_name"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "survey_questions", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "section_id"
    t.string "head_number"
    t.text "description"
    t.string "locale_text"
    t.string "locale_head_number"
    t.text "locale_description"
    t.integer "questions_type_id"
    t.boolean "mandatory", default: false
  end

  create_table "survey_sections", force: :cascade do |t|
    t.string "head_number"
    t.string "name"
    t.text "description"
    t.integer "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "locale_head_number"
    t.string "locale_name"
    t.text "locale_description"
  end

  create_table "survey_surveys", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "attempts_number", default: 0
    t.boolean "finished", default: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "locale_name"
    t.text "locale_description"
  end

  create_table "towns", force: :cascade do |t|
    t.string "zipcode"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_housings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "housing_id"
    t.integer "user_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["housing_id"], name: "index_user_housings_on_housing_id"
    t.index ["user_id"], name: "index_user_housings_on_user_id"
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "phone"
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "zones", force: :cascade do |t|
    t.bigint "town_id"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "id_zone"
    t.index ["town_id"], name: "index_zones_on_town_id"
  end

  add_foreign_key "bookings", "diagnostics"
  add_foreign_key "bookings", "housings"
  add_foreign_key "bookings", "users"
  add_foreign_key "points", "zones"
  add_foreign_key "user_housings", "housings"
  add_foreign_key "user_housings", "users"
  add_foreign_key "zones", "towns"
end
