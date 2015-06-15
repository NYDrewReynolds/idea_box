ActiveRecord::Schema.define(version: 20150614234453) do

  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "idea_images", force: :cascade do |t|
    t.integer  "image_id"
    t.integer  "idea_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "idea_images", ["idea_id"], name: "index_idea_images_on_idea_id", using: :btree
  add_index "idea_images", ["image_id"], name: "index_idea_images_on_image_id", using: :btree

  create_table "ideas", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
  end

  create_table "images", force: :cascade do |t|
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.integer  "role"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "idea_images", "ideas"
  add_foreign_key "idea_images", "images"
end
