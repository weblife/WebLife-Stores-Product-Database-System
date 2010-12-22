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

ActiveRecord::Schema.define(:version => 20101218154924) do

  create_table "compscrapers", :force => true do |t|
    t.integer  "user_id",                                                            :null => false
    t.string   "item_search_phrase"
    t.string   "word_that_occur"
    t.string   "sort_options"
    t.decimal  "lowest_price",        :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "decimal",             :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "second_lowest_price", :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "third_lowest_price",  :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "fourth_lowest_price", :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "fifth_lowest_price",  :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "sixth_lowest_price",  :precision => 8, :scale => 2, :default => 0.0
    t.string   "lowest_site"
    t.string   "second_lowest_site"
    t.string   "third_lowest_site"
    t.string   "fourth_lowest_site"
    t.string   "fifth_lowest_site"
    t.string   "sixth_lowest_site"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hard_code_informations", :force => true do |t|
    t.text   "promo_tag"
    t.string "backup_table_heading"
    t.text   "backup_table_text"
    t.text   "where_pro_coming_open_tag"
    t.text   "pdf_logo_image_url"
    t.text   "open_table_tag"
    t.text   "open_table_tag_1_of_3"
    t.text   "open_table_tag_2_of_3"
    t.text   "open_table_tag_3_of_3"
    t.text   "close_table_tag"
    t.text   "where_pro_coming_mid_section"
    t.text   "where_pro_coming_close_tag"
    t.text   "product_title_ot"
    t.string "product_title_ct"
    t.text   "related_downloads_ot"
    t.text   "re_dl_code_1_of_3"
    t.text   "re_dl_code_2_of_3"
    t.text   "re_dl_code_3_of_3"
    t.text   "re_dl_code_a1"
    t.text   "re_dl_code_a1_table"
    t.text   "re_dl_code_a2"
    t.text   "re_dl_code_a2_table"
    t.text   "man_title_ot"
    t.text   "man_title_ct"
    t.text   "reference_ot"
    t.string "reference_mid_tag"
    t.string "reference_mid_2"
    t.string "reference_end_tag"
    t.text   "instructions"
    t.text   "shipping_calculator"
    t.text   "return_detail_open"
    t.string "return_detail_close"
  end

  create_table "insets", :force => true do |t|
    t.integer  "product_id",               :null => false
    t.string   "inset",      :limit => 60
    t.string   "inset_2",    :limit => 60
    t.string   "inset_3",    :limit => 60
    t.string   "inset_4",    :limit => 60
    t.string   "inset_5",    :limit => 60
    t.string   "inset_6",    :limit => 60
    t.string   "inset_7",    :limit => 60
    t.string   "inset_8",    :limit => 60
    t.string   "inset_9",    :limit => 60
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.integer  "user_id",                                                                                                         :null => false
    t.text     "path"
    t.string   "manufacturer",                     :limit => 60
    t.string   "code",                             :limit => 20
    t.string   "name",                             :limit => 200
    t.string   "warranty",                         :limit => 200
    t.boolean  "is_usps_approved",                                                              :default => false
    t.string   "image",                            :limit => 60
    t.text     "Item_description_with_html"
    t.text     "options"
    t.text     "Item_description_without_html"
    t.string   "return_details",                   :limit => 200
    t.string   "availability",                     :limit => 200
    t.string   "shipping_time",                    :limit => 200
    t.string   "related_Items",                    :limit => 100
    t.string   "related_referrence_sku",           :limit => 60
    t.boolean  "promo_code_section_availablility",                                              :default => false
    t.string   "disclaimer_name",                  :limit => 60
    t.text     "disclaimer_text"
    t.text     "product_cmng_img_tag_html"
    t.text     "brief_summary_of_menu"
    t.decimal  "freight_cost_overide",                            :precision => 8, :scale => 2, :default => 0.0
    t.text     "po_description_details"
    t.integer  "origin_zip",                                                                    :default => 30087
    t.integer  "invalid_ship_methods",                                                          :default => 101
    t.boolean  "phone_number_visibility",                                                       :default => false
    t.boolean  "item_number_visiblity",                                                         :default => true
    t.string   "product_id",                       :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price_override",                                  :precision => 8, :scale => 2, :default => 0.0
    t.string   "active_status",                                                                 :default => "Active"
    t.string   "product_type",                                                                  :default => "Non-inventory Part"
    t.string   "cogs_account",                                                                  :default => "Cost of Goods Sold"
    t.string   "account",                                                                       :default => "Sales"
    t.string   "sales_tax_code",                                                                :default => "Tax"
    t.string   "purchased_for_resale",                                                          :default => "y"
    t.string   "is_new",                                                                        :default => "New"
    t.integer  "free_ship_method",                                                              :default => 1
    t.boolean  "taxable",                                                                       :default => true
    t.boolean  "ship_alone",                                                                    :default => false
    t.boolean  "free_shipping",                                                                 :default => false
    t.string   "po_description_detail",                                                         :default => "NONE"
    t.boolean  "commercial_free_shipping",                                                      :default => false
    t.boolean  "streetsign_free_shipping",                                                      :default => false
    t.boolean  "streetlights_free_shipping",                                                    :default => false
    t.boolean  "addressplaq_free_shipping",                                                     :default => false
    t.decimal  "commercial_adjustment",                           :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "streetsign_adjustment",                           :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "streetlights_adjustment",                         :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "addressplaq_adjustment",                          :precision => 8, :scale => 2, :default => 0.0
  end

  create_table "properties", :force => true do |t|
    t.integer  "product_id",                                                                         :null => false
    t.string   "material",             :limit => 30
    t.string   "style",                :limit => 30
    t.string   "color",                :limit => 30
    t.decimal  "actual_weight",                       :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "ship_weight",                         :precision => 8, :scale => 2, :default => 0.0
    t.string   "overall_size",         :limit => 200
    t.decimal  "wholesale_cost",                      :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "map_pricing",                         :precision => 8, :scale => 2, :default => 0.0
    t.integer  "number_of_boxes",                                                   :default => 1
    t.decimal  "multi_box_weights",                   :precision => 8, :scale => 2, :default => 0.0
    t.string   "multi_box_dimensions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stores", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "store_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "text_anchors", :force => true do |t|
    t.integer  "product_id",                    :null => false
    t.string   "anchor_text_1",  :limit => 200
    t.string   "anchor_text_2",  :limit => 200
    t.string   "anchor_text_3",  :limit => 200
    t.string   "anchor_text_4",  :limit => 200
    t.string   "anchor_text_5",  :limit => 200
    t.string   "anchor_text_6",  :limit => 200
    t.string   "anchor_text_7",  :limit => 200
    t.string   "anchor_text_8",  :limit => 200
    t.string   "anchor_text_9",  :limit => 200
    t.string   "anchor_text_10", :limit => 200
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "url_links", :force => true do |t|
    t.integer  "product_id",  :null => false
    t.string   "url_link_1"
    t.string   "url_link_2"
    t.string   "url_link_3"
    t.string   "url_link_4"
    t.string   "url_link_5"
    t.string   "url_link_6"
    t.string   "url_link_7"
    t.string   "url_link_8"
    t.string   "url_link_9"
    t.string   "url_link_10"
    t.datetime "created_at"
    t.datetime "updated_at"
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
