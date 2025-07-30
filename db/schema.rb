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

ActiveRecord::Schema[7.2].define(version: 2025_07_30_054119) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "marches", force: :cascade do |t|
    t.string "title", null: false, comment: "イベントのタイトル"
    t.text "body", null: false, comment: "イベントの詳細説明"
    t.bigint "user_id"
    t.string "location", null: false, comment: "イベントの場所"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_at", null: false, comment: "開始日時"
    t.datetime "end_at", null: false, comment: "終了日時"
    t.string "images", default: [], array: true
    t.index ["user_id"], name: "index_marches_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title", null: false
    t.text "body", null: false
    t.bigint "user_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "marches", "users"
  add_foreign_key "posts", "users"
end
