# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160207192418) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_posts", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "post_id"
  end

  add_index "categories_posts", ["category_id"], name: "index_categories_posts_on_category_id"
  add_index "categories_posts", ["post_id"], name: "index_categories_posts_on_post_id"

  create_table "comments", force: :cascade do |t|
    t.string   "name"
    t.text     "body"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"

  create_table "favourite_posts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "favourite_posts", ["post_id"], name: "index_favourite_posts_on_post_id"
  add_index "favourite_posts", ["user_id"], name: "index_favourite_posts_on_user_id"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id"
    t.string   "image"
    t.integer  "page_views", default: 0
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "avatar"
    t.string   "name"
    t.string   "lastname"
    t.boolean  "admin"
  end

end
