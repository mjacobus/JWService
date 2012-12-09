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

ActiveRecord::Schema.define(:version => 20121209184325) do

  create_table "apartments", :force => true do |t|
    t.string   "number"
    t.string   "owner"
    t.string   "email"
    t.string   "phone"
    t.text     "notes"
    t.date     "last_visited"
    t.integer  "building_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "visited",      :default => true
    t.boolean  "revisit",      :default => true
  end

  add_index "apartments", ["building_id"], :name => "index_apartments_on_building_id"

  create_table "buildings", :force => true do |t|
    t.string   "address"
    t.string   "number"
    t.text     "description"
    t.integer  "territory_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "buildings", ["territory_id"], :name => "index_buildings_on_territory_id"

  create_table "territories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
