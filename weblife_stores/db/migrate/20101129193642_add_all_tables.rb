class AddAllTables < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.integer :user_id, :null => false
      t.text :path, :limit => 400
      t.string :manufacturer, :limit => 60
      t.string :code, :limit => 20
      t.string :name, :limit => 200
      t.string :warranty, :limit => 200
      t.boolean :is_usps_approved,:default=>false
      t.string :image, :limit => 60
      t.text :Item_description_with_html
      t.text :options
      t.text :Item_description_without_html, :limit => 500
      t.string :return_details, :limit => 200
      t.string :availability, :limit => 200
      t.string :shipping_time, :limit => 200
      t.string :related_Items, :limit => 100
      t.string :related_referrence_sku, :limit => 60
      t.boolean :promo_code_section_availablility,:default=>false
      t.string :disclaimer_name, :limit => 60
      t.text :disclaimer_text, :limit => 400
      t.text :product_cmng_img_tag_html, :limit => 400
      t.text :brief_summary_of_menu
      t.decimal :freight_cost_overide , :precision=> 8 , :scale=>2,:default=>0
      t.text :po_description_details
      t.integer :origin_zip,:default=>0
      t.integer :invalid_ship_methods,:default=>0
      t.boolean :phone_number_visibility,:default=>false
      t.boolean :item_number_visiblity,:default=>false
      t.string :product_id, :limit => 100
      t.timestamps

    end
    create_table :insets do |t|
      t.integer :product_id,:null=>false
      t.string :inset, :limit => 60
      t.string :inset_2, :limit => 60
      t.string :inset_3, :limit => 60
      t.string :inset_4, :limit => 60
      t.string :inset_5, :limit => 60
      t.string :inset_6, :limit => 60
      t.string :inset_7, :limit => 60
      t.string :inset_8, :limit => 60
      t.string :inset_9, :limit => 60
      t.timestamps
    end
    create_table :url_links do |t|
      t.integer :product_id,:null=>false
      t.string :url_link_1
      t.string :url_link_2
      t.string :url_link_3
      t.string :url_link_4
      t.string :url_link_5
      t.string :url_link_6
      t.string :url_link_7
      t.string :url_link_8
      t.string :url_link_9
      t.string :url_link_10
      t.timestamps

    end
    create_table :text_anchors do |t|
      t.integer :product_id,:null=>false
      t.string :anchor_text_1, :limit => 200
      t.string :anchor_text_2, :limit => 200
      t.string :anchor_text_3, :limit => 200
      t.string :anchor_text_4, :limit => 200
      t.string :anchor_text_5, :limit => 200
      t.string :anchor_text_6, :limit => 200
      t.string :anchor_text_7, :limit => 200
      t.string :anchor_text_8, :limit => 200
      t.string :anchor_text_9, :limit => 200
      t.string :anchor_text_10, :limit => 200
      t.timestamps

    end
    create_table :properties do |t|
      t.integer :product_id,:null=>false
      t.string :material, :limit => 30
      t.string :style, :limit => 30
      t.string :color, :limit => 30
      t.decimal :actual_weight , :precision=> 8 , :scale=>2,:default=>0
      t.decimal :ship_weight , :precision=> 8 , :scale=>2,:default=>0
      t.string :overall_size, :limit => 200
      t.decimal :wholesale_cost , :precision=> 8 , :scale=>2,:default=>0
      t.decimal :map_pricing , :precision=> 8 , :scale=>2,:default=>0
      t.integer :number_of_boxes,:default=>0
      t.decimal :multi_box_weights , :precision=> 8 , :scale=>2,:default=>0
      t.string :multi_box_dimensions
      t.timestamps

    end

  end

  def self.down
    drop_table :products
    drop_table :insets
    drop_table :url_links
    drop_table :text_anchors
    drop_table :properties
  end
end
