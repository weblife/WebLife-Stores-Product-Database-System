# == Schema Information
#
# Table name: products
#
#  id                               :integer(4)      not null, primary key
#  user_id                          :integer(4)      not null
#  path                             :text
#  manufacturer                     :string(60)
#  code                             :string(20)
#  name                             :string(200)
#  warranty                         :string(200)
#  is_usps_approved                 :boolean(1)      default(FALSE)
#  image                            :string(60)
#  Item_description_with_html       :text
#  options                          :text
#  Item_description_without_html    :text
#  return_details                   :string(200)
#  availability                     :string(200)
#  shipping_time                    :string(200)
#  related_Items                    :string(100)
#  related_referrence_sku           :string(60)
#  promo_code_section_availablility :boolean(1)      default(FALSE)
#  disclaimer_name                  :string(60)
#  disclaimer_text                  :text
#  product_cmng_img_tag_html        :text
#  brief_summary_of_menu            :text
#  freight_cost_overide             :decimal(8, 2)   default(0.0)
#  po_description_details           :text
#  origin_zip                       :integer(4)      default(30087)
#  invalid_ship_methods             :integer(4)      default(101)
#  phone_number_visibility          :boolean(1)      default(FALSE)
#  item_number_visiblity            :boolean(1)      default(TRUE)
#  product_id                       :string(100)
#  created_at                       :datetime
#  updated_at                       :datetime
#  price_override                   :decimal(8, 2)   default(0.0)
#  active_status                    :string(255)     default("Active")
#  product_type                     :string(255)     default("Non-inventory Part")
#  cogs_account                     :string(255)     default("Cost of Goods Sold")
#  account                          :string(255)     default("Sales")
#  sales_tax_code                   :string(255)     default("Tax")
#  purchased_for_resale             :string(255)     default("y")
#  is_new                           :string(255)     default("New")
#  free_ship_method                 :integer(4)      default(1)
#  taxable                          :boolean(1)      default(TRUE)
#  ship_alone                       :boolean(1)      default(FALSE)
#  free_shipping                    :boolean(1)      default(FALSE)
#  po_description_detail            :string(255)     default("NONE")
#  commercial_free_shipping         :boolean(1)      default(FALSE)
#  streetsign_free_shipping         :boolean(1)      default(FALSE)
#  streetlights_free_shipping       :boolean(1)      default(FALSE)
#  addressplaq_free_shipping        :boolean(1)      default(FALSE)
#  commercial_adjustment            :decimal(8, 2)   default(0.0)
#  streetsign_adjustment            :decimal(8, 2)   default(0.0)
#  streetlights_adjustment          :decimal(8, 2)   default(0.0)
#  addressplaq_adjustment           :decimal(8, 2)   default(0.0)
#

# == Schema Information
#
# Table name: products
#
#  id                               :integer(4)      not null, primary key
#  user_id                          :integer(4)      not null
#  path                             :text
#  manufacturer                     :string(60)
#  code                             :string(20)
#  name                             :string(200)
#  warranty                         :string(200)
#  is_usps_approved                 :boolean(1)      default(FALSE)
#  image                            :string(60)
#  Item_description_with_html       :text
#  options                          :text
#  Item_description_without_html    :text
#  return_details                   :string(200)
#  availability                     :string(200)
#  shipping_time                    :string(200)
#  related_Items                    :string(100)
#  related_referrence_sku           :string(60)
#  promo_code_section_availablility :boolean(1)      default(FALSE)
#  disclaimer_name                  :string(60)
#  disclaimer_text                  :text
#  product_cmng_img_tag_html        :text
#  brief_summary_of_menu            :text
#  freight_cost_overide             :decimal(8, 2)   default(0.0)
#  po_description_details           :text
#  origin_zip                       :integer(4)      default(30087)
#  invalid_ship_methods             :integer(4)      default(101)
#  phone_number_visibility          :boolean(1)      default(FALSE)
#  item_number_visiblity            :boolean(1)      default(TRUE)
#  product_id                       :string(100)
#  created_at                       :datetime
#  updated_at                       :datetime
#  price_override                   :decimal(8, 2)   default(0.0)
#  active_status                    :string(255)     default("Active")
#  product_type                     :string(255)     default("Non-inventory Part")
#  cogs_account                     :string(255)     default("Cost of Goods Sold")
#  account                          :string(255)     default("Sales")
#  sales_tax_code                   :string(255)     default("Tax")
#  purchased_for_resale             :string(255)     default("y")
#  is_new                           :string(255)     default("New")
#  free_ship_method                 :integer(4)      default(1)
#  taxable                          :boolean(1)      default(TRUE)
#  ship_alone                       :boolean(1)      default(FALSE)
#  free_shipping                    :boolean(1)      default(FALSE)
#  po_description_detail            :string(255)     default("NONE")
#  commercial_free_shipping         :boolean(1)      default(FALSE)
#  streetsign_free_shipping         :boolean(1)      default(FALSE)
#  streetlights_free_shipping       :boolean(1)      default(FALSE)
#  addressplaq_free_shipping        :boolean(1)      default(FALSE)
#  commercial_adjustment            :decimal(8, 2)   default(0.0)
#  streetsign_adjustment            :decimal(8, 2)   default(0.0)
#  streetlights_adjustment          :decimal(8, 2)   default(0.0)
#  addressplaq_adjustment           :decimal(8, 2)   default(0.0)
#
require 'fastercsv'
class Product < ActiveRecord::Base

  belongs_to :user
  has_one :inset, :dependent => :destroy
  has_one :property, :dependent => :destroy
  has_one :text_anchor, :dependent => :destroy
  has_one :url_link, :dependent => :destroy
  has_one :compscraper, :dependent => :destroy

  accepts_nested_attributes_for :inset
  accepts_nested_attributes_for :property
  accepts_nested_attributes_for :text_anchor
  accepts_nested_attributes_for :url_link

  before_validation_on_create :initialize_children

  before_save :set_default_values

  after_create :create_compscraper

  #Output fields
  attr_accessor :output_product_url,:output_ship_weight,:output_description,:output_model_no,
                :output_return_details,:output_need_for_feed_under_70,:output_shipping_costs,
                :output_et_right_order,:output_caption,:output_sale_price,:output_price,:output_ships_within_for_feed,
                :output_size_for_data_feeds,:output_good_margins,:output_profit,:output_invalid_ship_method,
                :output_multibox_dimensions,:output_multibox_weights,:output_no_of_boxes,:output_origin_zip,
                :output_flat_ship_rate,:output_free_shipping,:output_item,:output_purchase_description,:output_et_right_cross,
                :output_et_right_break,:output_et_right_feature,:meta_data,:freight_cost,:raw_cost_and_freight_cost,
                :real_break_even,:estimated_break_even,:minimum_price_competitor,:price_match,:minimum_acceptable_markup,
                :profit_amount,:percentage_profit_amount,:formula_based_shipping,:acceptable_markup
#Boolean fields for validations
  attr_accessor :boolean_ups_approved_field,:boolean_promo_code_section_availablility,
                :boolean_phone_number_visibility,:boolean_item_number_visiblity,
                :boolean_shipping_free,:boolean_commercial_free_shipping,:boolean_streetsign_freeshiping,
                :boolean_streetlights_free_shipping,:boolean_addressplag_free_shipping

  # Custom model validation

  # Update the children to let them know they belong to the product this
  # is required since we validate children before the product is saved
  def initialize_children
    inset.product=self
    property.product=self
    text_anchor.product=self
    url_link.product=self
  end 

  validates_presence_of :product_id,:message=>"Id cannot be blank.",:on=>:create
  validates_presence_of :name,:message=>"Name cannot be blank."
  validates_format_of :product_id, :with => /^[a-z0-9-]+$/i,:message=>"product id format is invalid.",:allow_nil=>true,:on=>:create

  #validates_uniqueness_of :product_id,:message=>"Id must be uniq.",:allow_nil=>true,:on=>:create
  validates_numericality_of :freight_cost_overide,:message=>"Freight cost overide is not a number.",:allow_nil=>true
  validates_numericality_of :invalid_ship_methods,:only_integer=>true,:message=>"Invalid ship methods is not a number.",:allow_nil=>true
  validates_numericality_of :origin_zip,:only_integer=>true,:message=>"Origin Zip is not a number.",:allow_nil=>true
  validates_numericality_of :price_override,:message=>"Price overide is not a number.",:allow_nil=>true

  validates_inclusion_of :item_number_visiblity, :in => [true, false]

  
  before_validation :capitalize_boolean_fields_text_value
  validates_inclusion_of :boolean_ups_approved_field, :in => ["YES", "NO"],:message=>"USPS value should contain 'Yes' or 'No' ",:allow_nil=>true
  validates_inclusion_of :boolean_promo_code_section_availablility, :in => ["YES", "NO"],:message=>"Promo code section availability value should contain 'Yes' or 'No' ",:allow_nil=>true
  validates_inclusion_of :boolean_phone_number_visibility, :in => ["YES", "NO"],:message=>"Phone number value should contain 'Yes' or 'No' ",:allow_nil=>true
  validates_inclusion_of :boolean_item_number_visiblity, :in => ["YES", "NO"],:message=>"Item number visibility value should contain 'Yes' or 'No' ",:allow_nil=>true
  validates_inclusion_of :boolean_shipping_free, :in => ["YES", "NO"],:message=>"Shipping free value should contain 'Yes' or 'No' ",:allow_nil=>true
  validates_inclusion_of :boolean_commercial_free_shipping, :in => ["YES", "NO"],:message=>"Commercial free value should contain 'Yes' or 'No' ",:allow_nil=>true
  validates_inclusion_of :boolean_streetsign_freeshiping, :in => ["YES", "NO"],:message=>"StreetSign free value should contain 'Yes' or 'No' ",:allow_nil=>true
  validates_inclusion_of :boolean_streetlights_free_shipping, :in => ["YES", "NO"],:message=>"Streetlights free value should contain 'Yes' or 'No' ",:allow_nil=>true
  validates_inclusion_of :boolean_addressplag_free_shipping, :in => ["YES", "NO"],:message=>"Addressplag free value should contain 'Yes' or 'No' ",:allow_nil=>true

  validate :compare_price,:compare_price_with_markup



  before_save :change_text_values_to_boolean


  validates_length_of :product_id,:allow_nil => true,:maximum   => 100,:too_long  => "Product id must have at most 100 characters"
  validates_length_of :path,:allow_nil => true,:maximum   => 400,:too_long  => "Path must have at most 400 characters"
  validates_length_of :manufacturer,:allow_nil => true,:maximum   => 60,:too_long  => "Manufacturer must have at most 60 characters"
  validates_length_of :name,:allow_nil => true,:maximum   => 200,:too_long  => "Name must have at most 200 characters"
  validates_length_of :warranty,:allow_nil => true,:maximum   => 200,:too_long  => "Warranty must have at most 200 characters"
  validates_length_of :Item_description_without_html,:allow_nil => true,:maximum   => 500,:too_long  => "Item Description - NO HTML must have at most 500 characters"
  validates_length_of :return_details,:maximum   => 200,:too_long  => "Return details must have at most 200 characters",:allow_nil=>true
  validates_length_of :availability,:maximum   => 200,:too_long  => "Availability must have at most 200 characters",:allow_nil=>true
  validates_length_of :shipping_time,:maximum   => 200,:too_long  => "Shipping time must have at most 200 characters",:allow_nil=>true
  validates_length_of :related_referrence_sku,:allow_nil => true,:maximum   => 60,:too_long  => "Related Referrence SKU must have at most 60 characters"
  validates_length_of :disclaimer_name,:allow_nil => true,:maximum   => 60,:too_long  => "Disclaimer name must have at most 60 characters"
  validates_length_of :disclaimer_text,:allow_nil => true,:maximum   => 400,:too_long  => "Disclaimer text must have at most 400 characters"
  validates_length_of :product_cmng_img_tag_html,:allow_nil => true,:maximum   => 400,:too_long  => "Product cmng img tag html must have at most 400 characters"

    def self.parse_csv(file,current_user,is_uploading_require)
              #uploading file locally
              if is_uploading_require
                file_path=upload_file_locally(file,current_user,"input_csv")
              else
                file_path=file
              end
              product_array=['path','id','Manufacturer','code','name','Warranty','Is this item USPS Approved?','Image','Item Description - HTML','Options','Item Description - NO HTML','return details','Availability','Shipping-Time','Related Items','Related Referrence Sku','Promo-Code Section Available','disclaimer-name','disclaimer-text','Where-Prod-Cmng-Img-Tag-HTML','Brief Summary of Manu.','Freight Cost Overide','PO Description Details','Origin-zip','Invalid-ship-methods','Phone-number','Item-number-visiblity','Price Overide','Free Shipping','Commercial Free Shipping','Commercial Adjustment','StreetSign Free Shipping','StreetSign Adjustment','StreetLights Free Shipping','StreetLights Adjustment','AddressPlaq Free Shipping','AddressPlaq Adjustment','Suggested Retail Price Override','Override Acceptable Markup %','Promo text']
              inset_array=['Inset','Inset-2','Inset-3','Inset-4','Inset-5','Inset-6','Inset-7','Inset-8','Inset-9']
              property_array=['material','style','color','actual-weight','ship-weight','overall-size','Wholesale Cost','MAP Pricing','Number-of-boxes','Multi-box-weights','Multi-box-dimensions']
              text_achor_array=['1st anchor text','2nd anchor text','3rd anchor text','4th anchor text','5th anchor text','6th anchor text','7th anchor text','8th anchor text','9th anchor text','10th anchor text']
              url_link_array=['1st url link','2nd url link','3rd url link','4th url link','5th url link','6th url link','7th url link','8th url link','9th url link','10th url link']






              sequenced_csv_array=['path','Manufacturer','code','name','Item Description - HTML','Options','actual-weight','ship-weight','material','style','color','overall-size','Wholesale Cost','MAP Pricing','Item Description - NO HTML','return details','Availability','Shipping-Time','Warranty','Is this item USPS Approved?','Image','Inset','Inset-2','Inset-3','Inset-4','Inset-5','Related Items','id','Related Referrence Sku','Promo-Code Section Available','Inset-6','Inset-7','Inset-8','Inset-9','disclaimer-name','disclaimer-text','1st url link','1st anchor text','2nd url link','2nd anchor text','3rd url link','3rd anchor text','4th url link','4th anchor text','5th url link','5th anchor text','6th url link','6th anchor text','7th url link','7th anchor text','8th url link','8th anchor text','9th url link','9th anchor text','10th url link','10th anchor text','Where-Prod-Cmng-Img-Tag-HTML','Brief Summary of Manu.','Freight Cost Overide','PO Description Details','Origin-zip','Number-of-boxes','Multi-box-weights','Multi-box-dimensions','Invalid-ship-methods','Phone-number','Item-number-visiblity','Price Overide','Free Shipping','Commercial Free Shipping','Commercial Adjustment','StreetSign Free Shipping','StreetSign Adjustment','StreetLights Free Shipping','StreetLights Adjustment','AddressPlaq Free Shipping','AddressPlaq Adjustment','Suggested Retail Price Override','Override Acceptable Markup %','Promo text']
              sequenced_db_array=['path','manufacturer','code','name','Item_description_with_html','options','actual_weight','ship_weight','material','style','color','overall_size','wholesale_cost','map_pricing','Item_description_without_html','return_details','availability','shipping_time','warranty','boolean_ups_approved_field','image','inset','inset_2','inset_3','inset_4','inset_5','related_Items','product_id','related_referrence_sku','boolean_promo_code_section_availablility','inset_6','inset_7','inset_8','inset_9','disclaimer_name','disclaimer_text','url_link_1','anchor_text_1','url_link_2','anchor_text_2','url_link_3','anchor_text_3','url_link_4','anchor_text_4','url_link_5','anchor_text_5','url_link_6','anchor_text_6','url_link_7','anchor_text_7','url_link_8','anchor_text_8','url_link_9','anchor_text_9','url_link_10','anchor_text_10','product_cmng_img_tag_html','brief_summary_of_menu','freight_cost_overide','po_description_details','origin_zip','number_of_boxes','multi_box_weights','multi_box_dimensions','invalid_ship_methods','boolean_phone_number_visibility','boolean_item_number_visiblity','price_override','boolean_shipping_free','boolean_commercial_free_shipping','commercial_adjustment','boolean_streetsign_freeshiping','streetsign_adjustment','boolean_streetlights_free_shipping','streetlights_adjustment','boolean_addressplag_free_shipping','addressplaq_adjustment','suggested_retail_price_override','acceptable_markup','promo_text']
              params=Hash.new
              products_array=[]
              count=-1
              FasterCSV.foreach(file_path) do |row|
                params["product_#{count}"]=Hash.new
                params["product_#{count}"]["url_link"]=Hash.new
                params["product_#{count}"]["text_anchor"]=Hash.new
                params["product_#{count}"]["inset"]=Hash.new
                params["product_#{count}"]["property"]=Hash.new
                params["product_#{count}"]["product"]=Hash.new
                inner_count=0

                row.each do |cell|

                  if product_array.include?(sequenced_csv_array[inner_count])
                     params["product_#{count}"]["product"]["#{sequenced_db_array[inner_count]}"]=cell
                  elsif inset_array.include?(sequenced_csv_array[inner_count])
                     params["product_#{count}"]["inset"]["#{sequenced_db_array[inner_count]}"]=cell
                  elsif property_array.include?(sequenced_csv_array[inner_count])
                     params["product_#{count}"]["property"]["#{sequenced_db_array[inner_count]}"]=cell
                  elsif text_achor_array.include?(sequenced_csv_array[inner_count])
                     params["product_#{count}"]["text_anchor"]["#{sequenced_db_array[inner_count]}"]=cell
                  elsif url_link_array.include?(sequenced_csv_array[inner_count])
                     params["product_#{count}"]["url_link"]["#{sequenced_db_array[inner_count]}"]=cell
                  end
                  inner_count+=1
                end if count!=-1
                 if count!=-1
                  prod=params["product_#{count}"]["product"]

                  prod["inset_attributes"]=params["product_#{count}"]["inset"]
                  prod["property_attributes"]=params["product_#{count}"]["property"]
                  prod["text_anchor_attributes"]=params["product_#{count}"]["text_anchor"]
                  prod["url_link_attributes"]=params["product_#{count}"]["url_link"]
                  new_prod=Product.new(prod)

                  products_array << new_prod

                 end

                  count+=1
              end
              if is_uploading_require
                current_user.cached_information.back_product_reverted
                current_user.cached_information.set_product_cached_file(file_path)
              end
              
              return products_array
        end


  def self.upload_file_locally file, user,new_file_name
      ext_array = [".csv"]
      file_name= file.original_filename
      directory= "#{RAILS_ROOT}/input_files" #local directory path
      ext = File.extname(file_name)
      ext = ext.downcase
      if ext_array.include?(ext)
        local_path= File.join(directory,file_name)
        new_path= File.join(directory,"#{new_file_name}_#{user.id}_#{Time.now.strftime("%Y-%m-%dT%H:%M:%S%z")}.csv")
        file.rewind
        File.open(local_path,"wb"){|f| f.write(file.read)}
        File.rename(local_path,new_path)
        return new_path
      else
        raise "File is invalid."
      end
  end

  def self.search_products(searched_field,searched_text)
      
      db_field="code" if searched_field=="code"
      db_field="name" if searched_field=="name"
      db_field="product_id" if searched_field=="id"
      db_field="Item_description_with_html" if searched_field=="Item_description_with_html"
      db_field="manufacturer" if searched_field.blank? || (searched_field=="manufacturer") || db_field.blank?

      Product.find(:all,:conditions=>["#{db_field} LIKE ?","%#{searched_text}%"])
  end

  def self.find_recent_products(time)
      Product.find(:all,:conditions=>["updated_at>=?",Time.now.gmtime-(time.to_i.minutes)])
  end

  #output fields

  def output_product_url
      return "http://www.budgetmailboxes.com/#{product_id}.html"
  end

  def output_ship_weight
      (!property.actual_weight.blank? && property.actual_weight>150)?(150):(property.actual_weight)
  end

  def output_description

     (!self.Item_description_without_html.blank?)? (self.Item_description_without_html):("#{name}  and other products from #{manufacturer}")
  end

  def output_model_no
      code
  end

  def output_return_details
      meta_data.return_detail_open+"#{return_details}"+meta_data.return_detail_close
  end

  def output_need_for_feed_under_70
      return "" if name.blank?
      (name.length>70)? (name):(name)
  end
  def output_shipping_costs

      (self.free_shipping)?("Free Shipping Today!!"):(meta_data.shipping_calculator)
  end

  def output_et_right_order
      ((!related_Items.blank?)?("et-right-cross"):("et-right-new"))+"et-right-best"
      
  end

  def output_caption
      caption=""
      url_links=[url_link.url_link_1,url_link.url_link_2,url_link.url_link_3,url_link.url_link_4,url_link.url_link_5,url_link.url_link_6,url_link.url_link_7,url_link.url_link_8,url_link.url_link_9,url_link.url_link_10]
      text_anchors=[text_anchor.anchor_text_1,text_anchor.anchor_text_2,text_anchor.anchor_text_3,text_anchor.anchor_text_4,text_anchor.anchor_text_5,text_anchor.anchor_text_6,text_anchor.anchor_text_7,text_anchor.anchor_text_8,text_anchor.anchor_text_9,text_anchor.anchor_text_10]
      url_links.each_with_index do |url_link, i|
          caption+=(((self.promo_code_section_availablility)?(meta_data.promo_tag):(""))+meta_data.product_title_ot+(name||"")+meta_data.product_title_ct+(self.Item_description_with_html||"")+((!url_link.blank?)?(meta_data.related_downloads_ot+meta_data.open_table_tag+meta_data.open_table_tag_1_of_3+url_link+meta_data.open_table_tag_2_of_3+(text_anchors[i]||"")+meta_data.open_table_tag_3_of_3+meta_data.close_table_tag):(""))) if i==0
          caption+=(!url_link.blank?)? (meta_data.open_table_tag+meta_data.open_table_tag_1_of_3+url_link+meta_data.open_table_tag_2_of_3+(text_anchors[i]||"")+meta_data.open_table_tag_3_of_3+meta_data.close_table_tag):("") if i!=0
      end
      caption+=(meta_data.man_title_ot+" "+(manufacturer||"")+meta_data.man_title_ct)
      caption+= ((product_cmng_img_tag_html||"")+(brief_summary_of_menu||""))
      caption+=(meta_data.reference_ot+" "+(code||""))
      caption+=(!self.related_referrence_sku.blank?)? (meta_data.reference_mid_tag+self.name+" "+meta_data.reference_mid_2+self.related_referrence_sku+meta_data.reference_end_tag):("")
      return caption
  end
  def freight_cost
      (15+(self.property.wholesale_cost.to_f*0.1))
  end
  def raw_cost_and_freight_cost
      (freight_cost+self.property.wholesale_cost.to_f)
  end

  def output_sale_price
      (self.property.map_pricing.to_f>(estimated_break_even*minimum_acceptable_markup))?(self.property.map_pricing.to_f):((self.price_override.blank?)?((price_match<self.property.map_pricing.to_f)?(self.property.map_pricing.to_f):(price_match)):(self.price_override.to_f))
  end

  def real_break_even
      (raw_cost_and_freight_cost+(output_sale_price*0.04)).round(2)
  end

  def estimated_break_even
      (raw_cost_and_freight_cost*1.045).round(2)
  end
  def minimum_price_competitor
      compscraper.minimum_lowest_price rescue 0
  end
  def minimum_acceptable_markup
      if override_acceptable_markup.nil?
         ((self.property.wholesale_cost.to_f<20)?(2):((self.property.wholesale_cost.to_f<50)?(1.75):((self.property.wholesale_cost.to_f<150)?(1.5):((self.property.wholesale_cost.to_f<500)?(1.4):(1.25)))))
      else
          override_acceptable_markup
      end
  end
  def acceptable_markup
      ((override_acceptable_markup.nil?)?(minimum_acceptable_markup):(override_acceptable_markup)).to_f*100
  end
  def acceptable_markup=(val)
      self.override_acceptable_markup=(val.blank?)?(nil):(val.to_f/100)
  end
  def price_match
      ((!self.free_shipping)?((((self.property.wholesale_cost.to_f*minimum_acceptable_markup)<minimum_price_competitor.to_f))?(minimum_price_competitor.to_f-0.5):(self.property.wholesale_cost.to_f*minimum_acceptable_markup)):(((estimated_break_even*minimum_acceptable_markup)>minimum_price_competitor.to_f)?(estimated_break_even*minimum_acceptable_markup):(minimum_price_competitor.to_f-0.5))).round(2)
  end
  def formula_based_shipping
      (self.free_shipping)?(0):(freight_cost)
  end
  def profit_amount
      (self.free_shipping)?(output_sale_price-real_break_even):((output_sale_price+formula_based_shipping)-real_break_even)
  end
  def percentage_profit_amount
      ((profit_amount.to_f/output_sale_price.to_f)*100).round(2)
  end
  def output_price
      if suggested_retail_price_override.nil? || suggested_retail_price_override.to_f < output_sale_price.to_f
      (output_sale_price.to_f*1.25).ceil
      else
        suggested_retail_price_override
      end
  end

  def output_ships_within_for_feed
      availability
  end

  def output_size_for_data_feeds
      property.overall_size
  end
  def output_profit
      (self.free_shipping)?(output_sale_price.to_f-((output_sale_price.to_f*0.04)+(self.property.wholesale_cost.to_f+(15+self.property.wholesale_cost.to_f*0.1)))):(output_sale_price.to_f+([20+(self.property.actual_weight.to_f*0.45),((self.free_shipping)?(0):(15+(self.property.wholesale_cost.to_f*0.1))),0].max)-((output_sale_price.to_f*0.04)+(self.property.wholesale_cost.to_f+(15+self.property.wholesale_cost.to_f*0.1))))
  end
  def output_good_margins
      (output_profit>35)?("Yes"):("")
  end

  def output_invalid_ship_method
    101
  end

  def output_multibox_dimensions

  end

  def output_multibox_weights
    
  end

  def output_no_of_boxes
      1
  end

  def output_origin_zip
      62450
  end

  def output_flat_ship_rate
      freight_cost_overide
  end

  def output_free_shipping
      free_shipping
  end

  def output_item
      (!manufacturer.blank? && !code.blank?)?(manufacturer+":"+code):("")
  end

  def output_purchase_description
      manufacturer+":"+code+meta_data.instructions+po_description_detail
  end

  def output_et_right_cross
      related_Items
  end

  def output_et_right_break
      promo_text
  end
  def output_et_right_feature
  end

  def commercial_adjustment_rate
      (self.property.wholesale_cost.to_f<20)?(0.99):((self.property.wholesale_cost.to_f<50)?(0.95):((self.property.wholesale_cost.to_f<150)?(0.92):((self.property.wholesale_cost.to_f<500)?(0.9):(0.85))))
  end

  def meta_data
      HardCodeInformation.find :first
  end

  def self.find_latest_products(current_user)
      products=Product.find(:all,:conditions=>["user_id=? and created_at>=? and created_at<=?",current_user.id,current_user.cached_information.latest_products_uploaded_start_time,current_user.cached_information.latest_products_uploaded_end_time])
      updated_products=Product.find(:all,:conditions=>["user_id=? and updated_at>=? and updated_at<=?",current_user.id,current_user.cached_information.latest_products_uploaded_start_time,current_user.cached_information.latest_products_uploaded_end_time])
      updated_products.each do |p|
          products << p
      end
      products=products.uniq rescue nil
      return products
  end

  def self.count_latest_uploaded_products(user)
      added_products_count=updated_products_count=0
      added_products=Product.count(:all,:conditions=>["user_id=? and created_at>=? and created_at<=?",user.id,user.cached_information.latest_products_uploaded_start_time,user.cached_information.latest_products_uploaded_end_time])
      updated_products=Product.count(:all,:conditions=>["user_id=? and updated_at>=? and updated_at<=?",user.id,user.cached_information.latest_products_uploaded_start_time,user.cached_information.latest_products_uploaded_end_time])
      (added_products==updated_products)?(added_products_count=added_products):(added_products_count=added_products;updated_products_count=(updated_products-added_products))
      added_products_count=0 if added_products_count<0
      updated_products_count=0 if updated_products_count<0
      return added_products_count,updated_products_count
  end

  private
  def set_default_values
      self.active_status="Active" if self.active_status.blank?
      self.product_type="Non-inventory Part" if self.product_type.blank?
      self.cogs_account="Cost of Goods Sold" if self.cogs_account.blank?
      self.account="Sales" if self.account.blank?
      self.sales_tax_code="Tax" if self.sales_tax_code.blank?
      self.purchased_for_resale="y" if self.purchased_for_resale.blank?
      self.is_new="New" if self.is_new.blank?
      self.free_ship_method=1 if self.free_ship_method.blank?
      self.taxable=true if self.taxable.blank?
      self.ship_alone=false if self.ship_alone.blank?
      self.free_shipping=false if self.free_shipping.blank?
      self.po_description_detail="NONE" if self.po_description_detail.blank?
      self.commercial_free_shipping=false if self.commercial_free_shipping.blank?
      self.streetsign_free_shipping=false if self.streetsign_free_shipping.blank?
      self.streetlights_free_shipping=false if self.streetlights_free_shipping.blank?
      self.addressplaq_free_shipping=false if self.addressplaq_free_shipping.blank?
      self.commercial_adjustment=0 if self.commercial_adjustment.blank?
      self.streetsign_adjustment=0 if self.streetsign_adjustment.blank?
      self.streetlights_adjustment=0 if self.streetlights_adjustment.blank?
      self.addressplaq_adjustment=0 if self.addressplaq_adjustment.blank?

  end

  def capitalize_boolean_fields_text_value
      self.boolean_ups_approved_field=self.boolean_ups_approved_field.upcase rescue nil
      self.boolean_promo_code_section_availablility=self.boolean_promo_code_section_availablility.upcase rescue nil
      self.boolean_phone_number_visibility=self.boolean_phone_number_visibility.upcase rescue nil
      self.boolean_item_number_visiblity=self.boolean_item_number_visiblity.upcase rescue nil
      self.boolean_shipping_free=self.boolean_shipping_free.upcase rescue nil
      self.boolean_commercial_free_shipping=self.boolean_commercial_free_shipping.upcase rescue nil
      self.boolean_streetsign_freeshiping=self.boolean_streetsign_freeshiping.upcase rescue nil
      self.boolean_streetlights_free_shipping=self.boolean_streetlights_free_shipping.upcase rescue nil
      self.boolean_addressplag_free_shipping=self.boolean_addressplag_free_shipping.upcase rescue nil



  end

  def change_text_values_to_boolean
      self.is_usps_approved=true if self.boolean_ups_approved_field=="YES"
      self.promo_code_section_availablility=true if self.boolean_promo_code_section_availablility=="YES"
      self.phone_number_visibility=true if self.boolean_phone_number_visibility=="YES"
      self.item_number_visiblity=false if self.boolean_item_number_visiblity=="NO"
      self.free_shipping=true if self.boolean_shipping_free=="YES"
      self.commercial_free_shipping=true if self.boolean_commercial_free_shipping=="YES"
      self.streetsign_free_shipping=true if self.boolean_streetsign_freeshiping=="YES"
      self.streetlights_free_shipping=true if self.boolean_streetlights_free_shipping=="YES"
      self.addressplaq_free_shipping=true if self.boolean_addressplag_free_shipping=="YES"

  end

  def create_compscraper
      cp=Compscraper.new
      cp.product_id=self.id
      cp.user_id=self.user_id
      cp.save(false)
  end

  def compare_price
      errors.add(:suggested_retail_price_override,"Suggested Retail Price must be GREATER than sale Price.") if !suggested_retail_price_override.blank? && suggested_retail_price_override.to_f< output_sale_price.to_f
  end

  def compare_price_with_markup
      errors.add(:price_override,"Price Override is less than Minimum Acceptable Markup.") if !price_override.nil? && price_override.to_f < (minimum_acceptable_markup.to_f*self.property.wholesale_cost.to_f)
  end

end
