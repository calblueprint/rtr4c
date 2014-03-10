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

ActiveRecord::Schema.define(version: 20140306032405) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "donations", force: true do |t|
    t.integer  "donors_id"
    t.decimal  "amount"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "donors", force: true do |t|
    t.string   "amount"
    t.string   "email"
    t.string   "name"
    t.string   "title"
    t.text     "message"
    t.string   "profile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "press_updates", force: true do |t|
    t.string   "title"
    t.string   "link"
    t.string   "videolink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "updates", force: true do |t|
    t.string   "header"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
