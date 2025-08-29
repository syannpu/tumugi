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

ActiveRecord::Schema[7.2].define(version: 2025_08_29_021907) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "atmospheres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "marche_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["marche_id"], name: "index_bookmarks_on_marche_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "join_marches", force: :cascade do |t|
    t.bigint "marche_id"
    t.bigint "user_id"
    t.integer "approval_status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["marche_id"], name: "index_join_marches_on_marche_id"
    t.index ["user_id"], name: "index_join_marches_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "marche_atmospheres", force: :cascade do |t|
    t.bigint "marche_id"
    t.bigint "atmosphere_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["atmosphere_id"], name: "index_marche_atmospheres_on_atmosphere_id"
    t.index ["marche_id"], name: "index_marche_atmospheres_on_marche_id"
  end

  create_table "marche_prices", force: :cascade do |t|
    t.bigint "marche_id"
    t.bigint "price_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["marche_id", "price_id"], name: "index_marche_prices_on_marche_id_and_price_id", unique: true
    t.index ["marche_id"], name: "index_marche_prices_on_marche_id"
    t.index ["price_id"], name: "index_marche_prices_on_price_id"
  end

  create_table "marche_targets", force: :cascade do |t|
    t.bigint "marche_id"
    t.bigint "target_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["marche_id", "target_id"], name: "index_marche_targets_on_marche_id_and_target_id", unique: true
    t.index ["marche_id"], name: "index_marche_targets_on_marche_id"
    t.index ["target_id"], name: "index_marche_targets_on_target_id"
  end

  create_table "marches", force: :cascade do |t|
    t.string "title", null: false, comment: "イベントのタイトル"
    t.text "body", null: false, comment: "イベントの詳細説明"
    t.bigint "user_id"
    t.string "location", null: false, comment: "イベントの場所"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_at", null: false, comment: "出品募集開始"
    t.datetime "end_at", null: false, comment: "出品募集終了"
    t.string "images", default: [], array: true
    t.datetime "held_at"
    t.string "description"
    t.string "venue"
    t.text "schedule"
    t.string "layout_image"
    t.index ["user_id"], name: "index_marches_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title", null: false
    t.text "body", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "images", default: [], array: true
    t.string "youtube_url"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "prices", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "targets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "hometown"
    t.string "gender"
    t.integer "age"
    t.string "instagram"
    t.string "image"
    t.string "shop_name"
    t.text "products"
    t.string "experience"
    t.string "contact_info"
    t.text "self_pr"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookmarks", "marches"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "join_marches", "marches"
  add_foreign_key "join_marches", "users"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "marche_atmospheres", "atmospheres"
  add_foreign_key "marche_atmospheres", "marches"
  add_foreign_key "marche_prices", "marches"
  add_foreign_key "marche_prices", "prices"
  add_foreign_key "marche_targets", "marches"
  add_foreign_key "marche_targets", "targets"
  add_foreign_key "marches", "users"
  add_foreign_key "posts", "users"
end
