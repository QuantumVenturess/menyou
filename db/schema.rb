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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121221171707) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "slug"
    t.string   "image"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "categories", ["name"], :name => "index_categories_on_name", :unique => true
  add_index "categories", ["slug"], :name => "index_categories_on_slug"

  create_table "chefs", :force => true do |t|
    t.string   "name"
    t.text     "info"
    t.string   "image"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "slug"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "chefs", ["image"], :name => "index_chefs_on_image"
  add_index "chefs", ["info"], :name => "index_chefs_on_info"
  add_index "chefs", ["name"], :name => "index_chefs_on_name"
  add_index "chefs", ["slug"], :name => "index_chefs_on_slug"

  create_table "comments", :force => true do |t|
    t.string   "email"
    t.text     "content"
    t.boolean  "read",       :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "comments", ["content"], :name => "index_comments_on_content"
  add_index "comments", ["email"], :name => "index_comments_on_email"
  add_index "comments", ["read"], :name => "index_comments_on_read"

  create_table "items", :force => true do |t|
    t.string   "name"
    t.text     "info"
    t.boolean  "spicy",              :default => false
    t.string   "image"
    t.float    "small_price"
    t.float    "large_price"
    t.integer  "category_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "items", ["category_id"], :name => "index_items_on_category_id"
  add_index "items", ["image"], :name => "index_items_on_image"
  add_index "items", ["info"], :name => "index_items_on_info"
  add_index "items", ["large_price"], :name => "index_items_on_large_price"
  add_index "items", ["name"], :name => "index_items_on_name"
  add_index "items", ["small_price"], :name => "index_items_on_small_price"
  add_index "items", ["spicy"], :name => "index_items_on_spicy"

  create_table "photos", :force => true do |t|
    t.string   "name"
    t.string   "file"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "width"
    t.integer  "height"
  end

  add_index "photos", ["file"], :name => "index_photos_on_file"
  add_index "photos", ["height"], :name => "index_photos_on_height"
  add_index "photos", ["name"], :name => "index_photos_on_name"
  add_index "photos", ["width"], :name => "index_photos_on_width"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "slug"
    t.boolean  "admin"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "users", ["admin"], :name => "index_users_on_admin"
  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["name"], :name => "index_users_on_name"
  add_index "users", ["slug"], :name => "index_users_on_slug"

end
