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

ActiveRecord::Schema.define(version: 20180606063627) do

  create_table "carts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "Product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Product_id"], name: "index_carts_on_Product_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string "name"
    t.date "start"
    t.date "end"
    t.string "IMAGE_URL"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.integer "price"
    t.integer "qty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "user_id"
    t.string "Image_Url"
    t.string "sub_category"
    t.string "sizes", default: "--- []\n"
    t.integer "qtys", default: 0
    t.string "tags", default: "--- []\n"
    t.string "colour"
    t.string "brand"
    t.integer "discounted_price"
    t.integer "discount_starts"
    t.integer "discounted_ends"
    t.string "current_price"
    t.string "current_qty"
  end

  create_table "wishlists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "Product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Product_id"], name: "index_wishlists_on_Product_id"
  end

end
