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

ActiveRecord::Schema.define(:version => 20130503125950) do

  create_table "girls", :force => true do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "img_path"
    t.integer  "total_matches", :default => 0
    t.integer  "matches_won",   :default => 0
    t.integer  "matches_lost",  :default => 0
    t.integer  "rating",        :default => 1400
    t.integer  "ranking"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "matches", :force => true do |t|
    t.integer  "girl_one"
    t.integer  "girl_two"
    t.integer  "matches",      :default => 0
    t.integer  "girl_one_won", :default => 0
    t.integer  "girl_two_won", :default => 0
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

end
