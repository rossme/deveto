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

ActiveRecord::Schema.define(version: 2020_09_03_090500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "household_movies", force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "household_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "randomize_option_id", null: false
    t.index ["household_id"], name: "index_household_movies_on_household_id"
    t.index ["movie_id"], name: "index_household_movies_on_movie_id"
    t.index ["randomize_option_id"], name: "index_household_movies_on_randomize_option_id"
  end

  create_table "households", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.float "rating"
    t.string "released"
    t.string "media"
    t.string "netflixid"
    t.string "synopsis"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.string "runtime"
  end

  create_table "randomize_options", force: :cascade do |t|
    t.string "name"
    t.integer "points"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_households", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "household_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["household_id"], name: "index_user_households_on_household_id"
    t.index ["user_id"], name: "index_user_households_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "household_movies", "households"
  add_foreign_key "household_movies", "movies"
  add_foreign_key "household_movies", "randomize_options"
  add_foreign_key "user_households", "households"
  add_foreign_key "user_households", "users"
end
