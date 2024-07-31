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

ActiveRecord::Schema[7.1].define(version: 2024_07_30_141750) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "body_parts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "environments", force: :cascade do |t|
    t.string "environment_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skin_concerns", force: :cascade do |t|
    t.string "concern"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skin_types", force: :cascade do |t|
    t.string "skin_type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skincare_types", force: :cascade do |t|
    t.string "skincare_type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "survey_body_parts", force: :cascade do |t|
    t.integer "survey_id"
    t.integer "body_part_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "survey_environments", force: :cascade do |t|
    t.integer "survey_id"
    t.integer "environment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "survey_skin_concerns", force: :cascade do |t|
    t.integer "survey_id"
    t.integer "skin_concern_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "survey_skin_types", force: :cascade do |t|
    t.integer "survey_id"
    t.integer "skin_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "survey_skincare_types", force: :cascade do |t|
    t.integer "survey_id"
    t.integer "skincare_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.integer "user_id"
    t.text "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "crypted_password"
    t.string "salt"
    t.date "date_of_birth"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "survey_body_parts", "body_parts"
  add_foreign_key "survey_body_parts", "surveys"
  add_foreign_key "survey_environments", "environments"
  add_foreign_key "survey_environments", "surveys"
  add_foreign_key "survey_skin_concerns", "skin_concerns"
  add_foreign_key "survey_skin_concerns", "surveys"
  add_foreign_key "survey_skin_types", "skin_types"
  add_foreign_key "survey_skin_types", "surveys"
  add_foreign_key "survey_skincare_types", "skincare_types"
  add_foreign_key "survey_skincare_types", "surveys"
  add_foreign_key "surveys", "users"
end
