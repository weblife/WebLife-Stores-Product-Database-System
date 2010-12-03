# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101203204601) do

  create_table "insets", :force => true do |t|
    t.integer "product_id",               :null => false
    t.string  "inset",      :limit => 60
    t.string  "inset_2",    :limit => 60
    t.string  "inset_3",    :limit => 60
    t.string  "inset_4",    :limit => 60
    t.string  "inset_5",    :limit => 60
    t.string  "inset_6",    :limit => 60
    t.string  "inset_7",    :limit => 60
    t.string  "inset_8",    :limit => 60
    t.string  "inset_9",    :limit => 60
  end

  create_table "products", :id => false, :force => true do |t|
    t.string  "id",                               :limit => 100,                                                  :null => false
    t.integer "user_id",                                                                                          :null => false
    t.text    "path"
    t.string  "manufacturer",                     :limit => 60
    t.string  "code",                             :limit => 20
    t.string  "name",                             :limit => 200
    t.string  "warranty",                         :limit => 200
    t.boolean "is_usps_approved",                                                              :default => false
    t.string  "image",                            :limit => 60
    t.text    "Item_description_with_html"
    t.text    "options"
    t.text    "Item_description_without_html"
    t.string  "return_details",                   :limit => 200
    t.string  "availability",                     :limit => 200
    t.string  "shipping_time",                    :limit => 200
    t.string  "related_Items",                    :limit => 100
    t.string  "related_referrence_sku",           :limit => 60
    t.boolean "promo_code_section_availablility",                                              :default => false
    t.string  "disclaimer_name",                  :limit => 60
    t.text    "disclaimer_text"
    t.text    "product_cmng_img_tag_html"
    t.text    "brief_summary_of_menu"
    t.decimal "freight_cost_overide",                            :precision => 8, :scale => 2, :default => 0.0
    t.text    "po_description_details"
    t.integer "origin_zip",                                                                    :default => 0
    t.integer "invalid_ship_methods",                                                          :default => 0
    t.boolean "phone_number_visibility",                                                       :default => false
    t.boolean "item_number_visiblity",                                                         :default => false
  end

  create_table "properties", :force => true do |t|
    t.integer "product_id",                                                                         :null => false
    t.string  "material",             :limit => 30
    t.string  "style",                :limit => 30
    t.string  "color",                :limit => 30
    t.decimal "actual_weight",                       :precision => 8, :scale => 2, :default => 0.0
    t.decimal "ship_weight",                         :precision => 8, :scale => 2, :default => 0.0
    t.string  "overall_size",         :limit => 200
    t.decimal "wholesale_cost",                      :precision => 8, :scale => 2, :default => 0.0
    t.decimal "map_pricing",                         :precision => 8, :scale => 2, :default => 0.0
    t.integer "number_of_boxes",                                                   :default => 0
    t.decimal "multi_box_weights",                   :precision => 8, :scale => 2, :default => 0.0
    t.string  "multi_box_dimensions"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "text_anchors", :force => true do |t|
    t.integer "product_id",                    :null => false
    t.string  "anchor_text_1",  :limit => 200
    t.string  "anchor_text_2",  :limit => 200
    t.string  "anchor_text_3",  :limit => 200
    t.string  "anchor_text_4",  :limit => 200
    t.string  "anchor_text_5",  :limit => 200
    t.string  "anchor_text_6",  :limit => 200
    t.string  "anchor_text_7",  :limit => 200
    t.string  "anchor_text_8",  :limit => 200
    t.string  "anchor_text_9",  :limit => 200
    t.string  "anchor_text_10", :limit => 200
  end

  create_table "url_links", :force => true do |t|
    t.integer "product_id",  :null => false
    t.string  "url_link_1"
    t.string  "url_link_2"
    t.string  "url_link_3"
    t.string  "url_link_4"
    t.string  "url_link_5"
    t.string  "url_link_6"
    t.string  "url_link_7"
    t.string  "url_link_8"
    t.string  "url_link_9"
    t.string  "url_link_10"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "state",                                    :default => "passive"
    t.datetime "deleted_at"
    t.boolean  "is_admin",                                 :default => false
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
