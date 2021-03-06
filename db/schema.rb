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

ActiveRecord::Schema.define(version: 2020_10_01_141759) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "images", force: :cascade do |t|
    t.string "img_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "category_id"
    t.text "scramble_pos"
    t.index ["category_id"], name: "index_images_on_category_id"
    t.index ["user_id"], name: "index_images_on_user_id"
  end

  create_table "user_images", force: :cascade do |t|
    t.integer "moves", default: 0
    t.boolean "completed", default: false
    t.bigint "user_id", null: false
    t.bigint "image_id", null: false
    t.integer "grid_size", default: 4
    t.index ["image_id"], name: "index_user_images_on_image_id"
    t.index ["user_id"], name: "index_user_images_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "images", "categories"
  add_foreign_key "images", "users"
  add_foreign_key "user_images", "images"
  add_foreign_key "user_images", "users"
end
