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

ActiveRecord::Schema.define(:version => 20130404161713) do

  create_table "models", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "models_i18n", :force => true do |t|
    t.integer  "model_id",   :null => false
    t.string   "locale",     :null => false
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "models_i18n", ["created_at"], :name => "index_models_i18n_on_created_at"
  add_index "models_i18n", ["locale"], :name => "index_models_i18n_on_locale"
  add_index "models_i18n", ["model_id"], :name => "index_models_i18n_on_model_id"
  add_index "models_i18n", ["name"], :name => "index_models_i18n_on_name"
  add_index "models_i18n", ["updated_at"], :name => "index_models_i18n_on_updated_at"

end
