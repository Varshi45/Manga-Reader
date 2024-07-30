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

ActiveRecord::Schema[7.1].define(version: 2024_07_30_114251) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "manga_id", null: false
    t.bigint "user_id", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manga_id"], name: "index_comments_on_manga_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "link"
    t.bigint "manga_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manga_id"], name: "index_images_on_manga_id"
  end

  create_table "mangas", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.date "first_published_date"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category", default: [], array: true
    t.decimal "rating", precision: 3, scale: 1, default: "0.0"
    t.integer "views_count", default: 0, null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "manga_id", null: false
    t.bigint "user_id", null: false
    t.decimal "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manga_id"], name: "index_ratings_on_manga_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
  end

  add_foreign_key "comments", "mangas"
  add_foreign_key "comments", "users"
  add_foreign_key "images", "mangas"
  add_foreign_key "ratings", "mangas"
  add_foreign_key "ratings", "users"
end
