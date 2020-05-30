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

ActiveRecord::Schema.define(version: 2020_05_29_224800) do

  create_table "comment_of_profiles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "profile_id", null: false
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profile_id"], name: "index_comment_of_profiles_on_profile_id"
    t.index ["user_id"], name: "index_comment_of_profiles_on_user_id"
  end

  create_table "comment_of_proposals", force: :cascade do |t|
    t.integer "vacuancy_job_id", null: false
    t.integer "user_id", null: false
    t.string "comment"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_comment_of_proposals_on_user_id"
    t.index ["vacuancy_job_id"], name: "index_comment_of_proposals_on_vacuancy_job_id"
  end

  create_table "comment_of_rejects", force: :cascade do |t|
    t.integer "vacuancy_job_id", null: false
    t.integer "user_id", null: false
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_comment_of_rejects_on_user_id"
    t.index ["vacuancy_job_id"], name: "index_comment_of_rejects_on_vacuancy_job_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "profile_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profile_id"], name: "index_favorites_on_profile_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.integer "vacuancy_job_id", null: false
    t.integer "user_id", null: false
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_job_applications_on_user_id"
    t.index ["vacuancy_job_id"], name: "index_job_applications_on_vacuancy_job_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.string "social_name"
    t.date "date_of_birth"
    t.string "formations"
    t.text "xp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vacuancy_jobs", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "ability_description"
    t.float "initial_salary"
    t.float "end_salary"
    t.integer "level"
    t.date "limit_date"
    t.string "addresse"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_vacuancy_jobs_on_user_id"
  end

  add_foreign_key "comment_of_profiles", "profiles"
  add_foreign_key "comment_of_profiles", "users"
  add_foreign_key "comment_of_proposals", "users"
  add_foreign_key "comment_of_proposals", "vacuancy_jobs"
  add_foreign_key "comment_of_rejects", "users"
  add_foreign_key "comment_of_rejects", "vacuancy_jobs"
  add_foreign_key "favorites", "profiles"
  add_foreign_key "favorites", "users"
  add_foreign_key "job_applications", "users"
  add_foreign_key "job_applications", "vacuancy_jobs"
  add_foreign_key "profiles", "users"
  add_foreign_key "vacuancy_jobs", "users"
end
