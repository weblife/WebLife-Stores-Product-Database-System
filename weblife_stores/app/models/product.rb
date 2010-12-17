class Product < ActiveRecord::Base
  require 'csv'
  belongs_to :user
  has_one :inset, :dependent => :destroy
  has_one :property, :dependent => :destroy
  has_one :text_anchor, :dependent => :destroy
  has_one :url_link, :dependent => :destroy

  accepts_nested_attributes_for :inset
  accepts_nested_attributes_for :property
  accepts_nested_attributes_for :text_anchor
  accepts_nested_attributes_for :url_link

  before_validation_on_create :initialize_children

  before_save :set_default_values

  #Output fields
  attr_accessor :output_product_url,:output_ship_weight,:output_description,:output_model_no,
                :output_return_details,:output_need_for_feed_under_70,:output_shipping_costs,
                :output_et_right_order,:output_caption,:output_sale_price,:output_price,:output_ships_within_for_feed,
                :output_size_for_data_feeds,:output_good_margins,:output_profit,:output_invalid_ship_method,
                :output_multibox_dimensions,:output_multibox_weights,:output_no_of_boxes,:output_origin_zip,
                :output_flat_ship_rate,:output_free_shipping,:output_item,:output_purchase_description,:output_et_right_cross,
                :output_et_right_break,:output_et_right_feature,:commercial_adjustment
#Boolean fields for validations
  attr_accessor :boolean_ups_approved_field,:boolean_promo_code_section_availablility,
                :boolean_phone_number_visibility,:boolean_item_number_visiblity

  # Custom model validation

  # Update the children to let them know they belong to the product this
  # is required since we validate children before the product is saved
  def initialize_children
    inset.product=self
    property.product=self
    text_anchor.product=self
    url_link.product=self
  end 

  validates_presence_of :product_id,:message=>"Id cannot be blank."
  validates_format_of :product_id, :with => /^[a-z0-9-]+$/i,:message=>"product id format is invalid.",:allow_nil=>true
  
  validates_presence_of :image,:message=>"Image cannot be blank."
  validates_presence_of :Item_description_with_html,:message=>"Item Description - HTML cannot be blank."
  validates_presence_of :return_details,:message=>"Return details cannot be blank."
  validates_presence_of :availability,:message=>"Availability cannot be blank."
  validates_presence_of :shipping_time,:message=>"Shipping time cannot be blank."
  validates_uniqueness_of :product_id,:message=>"Id must be uniq.",:allow_nil=>true
  validates_numericality_of :freight_cost_overide,:message=>"Freight cost overide is not a number.",:allow_nil=>true
  validates_numericality_of :invalid_ship_methods,:only_integer=>true,:message=>"Invalid ship methods is not a number."
  validates_numericality_of :origin_zip,:only_integer=>true,:message=>"Origin Zip is not a number."
  validates_numericality_of :price_override,:message=>"Price overide is not a number.",:allow_nil=>true

  validates_inclusion_of :item_number_visiblity, :in => [true, false]

  
  before_validation :capitalize_boolean_fields_text_value
  validates_inclusion_of :boolean_ups_approved_field, :in => ["YES", "NO"],:message=>"USPS value should contain 'Yes' or 'No' "
  validates_inclusion_of :boolean_promo_code_section_availablility, :in => ["YES", "NO"],:message=>"Promo code section availability value should contain 'Yes' or 'No' "
  validates_inclusion_of :boolean_phone_number_visibility, :in => ["YES", "NO"],:message=>"Phone number value should contain 'Yes' or 'No' "
  validates_inclusion_of :boolean_item_number_visiblity, :in => ["YES", "NO"],:message=>"Item number visibility value should contain 'Yes' or 'No' "


  before_save :change_text_values_to_boolean


  validates_length_of :product_id,
                      :allow_nil => true,
                      :maximum   => 100,
                      :too_long  => "Product id must have at most 100 characters"

  validates_length_of :path,
                      :allow_nil => true,
                      :maximum   => 400,
                      :too_long  => "Path must have at most 400 characters"
  validates_length_of :manufacturer,
                      :allow_nil => true,
                      :maximum   => 60,
                      :too_long  => "Manufacturer must have at most 60 characters"
  validates_length_of :code,
                      :allow_nil => true,
                      :maximum   => 20,
                      :too_long  => "Code must have at most 20 characters"
  validates_length_of :name,
                      :allow_nil => true,
                      :maximum   => 200,
                      :too_long  => "Name must have at most 200 characters"

  validates_length_of :warranty,
                      :allow_nil => true,
                      :maximum   => 200,
                      :too_long  => "Warranty must have at most 200 characters"
                    
  validates_length_of :image,
                      :maximum   => 60,
                      :too_long  => "Image must have at most 60 characters"

  validates_length_of :Item_description_without_html,
                      :allow_nil => true,
                      :maximum   => 500,
                      :too_long  => "Item Description - NO HTML must have at most 500 characters"

  validates_length_of :return_details,
                      :maximum   => 200,
                      :too_long  => "Return details must have at most 200 characters"

  validates_length_of :availability,
                      :maximum   => 200,
                      :too_long  => "Availability must have at most 200 characters"

  validates_length_of :shipping_time,
                      :maximum   => 200,
                      :too_long  => "Shipping time must have at most 200 characters"

  validates_length_of :related_Items,
                      :allow_nil => true,
                      :maximum   => 100,
                      :too_long  => "Related items must have at most 100 characters"

  validates_length_of :related_referrence_sku,
                      :allow_nil => true,
                      :maximum   => 60,
                      :too_long  => "Related Referrence SKU must have at most 60 characters"

  validates_length_of :disclaimer_name,
                      :allow_nil => true,
                      :maximum   => 60,
                      :too_long  => "Disclaimer name must have at most 60 characters"

  validates_length_of :disclaimer_text,
                      :allow_nil => true,
                      :maximum   => 400,
                      :too_long  => "Disclaimer text must have at most 400 characters"

  validates_length_of :product_cmng_img_tag_html,
                      :allow_nil => true,
                      :maximum   => 400,
                      :too_long  => "Product cmng img tag html must have at most 400 characters"




    def self.parse_csv(file,current_user,is_uploading_require)
              #uploading file locally
              if is_uploading_require
                file_path=upload_file_locally(file,current_user,"input_csv")
              else
                file_path=file
              end
              product_array=['path','id','Manufacturer','code','name','Warranty','Is this item USPS Approved?','Image','Item Description - HTML','Options','Item Description - NO HTML','return details','Availability','Shipping-Time','Related Items','Related Referrence Sku','Promo-Code Section Available','disclaimer-name','disclaimer-text','Where-Prod-Cmng-Img-Tag-HTML','Brief Summary of Manu.','Freight Cost Overide','PO Description Details','Origin-zip','Invalid-ship-methods','Phone-number','Item-number-visiblity','Price Overide']
              inset_array=['Inset','Inset-2','Inset-3','Inset-4','Inset-5','Inset-6','Inset-7','Inset-8','Inset-9']
              property_array=['material','style','color','actual-weight','ship-weight','overall-size','Wholesale Cost','MAP Pricing','Number-of-boxes','Multi-box-weights','Multi-box-dimensions']
              text_achor_array=['1st anchor text','2nd anchor text','3rd anchor text','4th anchor text','5th anchor text','6th anchor text','7th anchor text','8th anchor text','9th anchor text','10th anchor text']
              url_link_array=['1st url link','2nd url link','3rd url link','4th url link','5th url link','6th url link','7th url link','8th url link','9th url link','10th url link']



              sequenced_csv_array=['path','Manufacturer','code','name','Item Description - HTML','Options','actual-weight','ship-weight','material','style','color','overall-size','Wholesale Cost','MAP Pricing','Item Description - NO HTML','return details','Availability','Shipping-Time','Warranty','Is this item USPS Approved?','Image','Inset','Inset-2','Inset-3','Inset-4','Inset-5','Related Items','id','Related Referrence Sku','Promo-Code Section Available','Inset-6','Inset-7','Inset-8','Inset-9','disclaimer-name','disclaimer-text','1st url link','1st anchor text','2nd url link','2nd anchor text','3rd url link','3rd anchor text','4th url link','4th anchor text','5th url link','5th anchor text','6th url link','6th anchor text','7th url link','7th anchor text','8th url link','8th anchor text','9th url link','9th anchor text','10th url link','10th anchor text','Where-Prod-Cmng-Img-Tag-HTML','Brief Summary of Manu.','Freight Cost Overide','PO Description Details','Origin-zip','Number-of-boxes','Multi-box-weights','Multi-box-dimensions','Invalid-ship-methods','Phone-number','Item-number-visiblity','Price Overide']
              sequenced_db_array=['path','manufacturer','code','name','Item_description_with_html','options','actual_weight','ship_weight','material','style','color','overall_size','wholesale_cost','map_pricing','Item_description_without_html','return_details','availability','shipping_time','warranty','boolean_ups_approved_field','image','inset','inset_2','inset_3','inset_4','inset_5','related_Items','product_id','related_referrence_sku','boolean_promo_code_section_availablility','inset_6','inset_7','inset_8','inset_9','disclaimer_name','disclaimer_text','url_link_1','anchor_text_1','url_link_2','anchor_text_2','url_link_3','anchor_text_3','url_link_4','anchor_text_4','url_link_5','anchor_text_5','url_link_6','anchor_text_6','url_link_7','anchor_text_7','url_link_8','anchor_text_8','url_link_9','anchor_text_9','url_link_10','anchor_text_10','product_cmng_img_tag_html','brief_summary_of_menu','freight_cost_overide','po_description_details','origin_zip','number_of_boxes','multi_box_weights','multi_box_dimensions','invalid_ship_methods','boolean_phone_number_visibility','boolean_item_number_visiblity','price_override']
              params=Hash.new
              products_array=[]
              count=-1
              CSV.open(file_path, 'r') do |row|
                params["product_#{count}"]=Hash.new
                params["product_#{count}"]["url_link"]=Hash.new
                params["product_#{count}"]["text_anchor"]=Hash.new
                params["product_#{count}"]["inset"]=Hash.new
                params["product_#{count}"]["property"]=Hash.new
                params["product_#{count}"]["product"]=Hash.new
                inner_count=0

                row.each do |cell|

                  if product_array.include?(sequenced_csv_array[inner_count])
                     params["product_#{count}"]["product"].store("#{sequenced_db_array[inner_count]}",cell)
                  elsif inset_array.include?(sequenced_csv_array[inner_count])
                     params["product_#{count}"]["inset"].store("#{sequenced_db_array[inner_count]}",cell)
                  elsif property_array.include?(sequenced_csv_array[inner_count])
                     params["product_#{count}"]["property"].store("#{sequenced_db_array[inner_count]}",cell)
                  elsif text_achor_array.include?(sequenced_csv_array[inner_count])
                     params["product_#{count}"]["text_anchor"].store("#{sequenced_db_array[inner_count]}",cell)
                  elsif url_link_array.include?(sequenced_csv_array[inner_count])
                     params["product_#{count}"]["url_link"].store("#{sequenced_db_array[inner_count]}",cell)
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
              #File.delete(file_path)
              return products_array,file_path
        end


  def self.upload_file_locally file, user,new_file_name
    #begin
      ext_array = [".csv"]
      file_name= file.original_filename
      directory= "#{RAILS_ROOT}/public/input_files" #local directory path
      ext = File.extname(file_name)
      ext = ext.downcase
      if ext_array.include?(ext)
        local_path= File.join(directory,file_name)
        new_path= File.join(directory,"#{new_file_name}_#{user.id}")
        file.rewind
        File.open(local_path,"wb"){|f| f.write(file.read)}
        File.rename(local_path,new_path)
        return new_path
      else
        return nil
      end
#    rescue
#      return nil
#    end
  end

  def self.search_products(searched_field,searched_text)
      Product.find(:all,:conditions=>["#{searched_field} LIKE ?","%#{searched_text}%"])
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
    "<a href='#' onclick='mywindow=window.open('return-policy.html','MyWindow','toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=600,height=600'); return false;' rel='nofollow'>" +"#{return_details}"+"</A>"
  end

  def output_need_for_feed_under_70
      return "" if name.blank?
      (name.length>70)? (name):(name)
  end
  def output_shipping_costs
      (self.free_shipping)?("Free Shipping Today!!"):("<a href='#' onclick='mywindow=window.open('how-shipping-works2.html','MyWindow','toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=600,height=500'); return false;' rel='nofollow'>Shipping Calculator</a></p>")
  end

  def output_et_right_order
      ((!related_Items.blank?)?("et-right-cross"):("et-right-new"))+"et-right-best"
      
  end

  def output_caption
      caption=""
      hardcode_c3="<p style='clear:left'><img src='/lib/yhst-14044557065217/Promo-Offer.GIF' alt='Promo Offer' width='131' height='35' /></p><p style='border: 1px solid rgb(204, 204, 204); margin: 5px 0pt; padding: 0px;'></p><strong>View all current <a href='#' onclick='mywindow=window.open('promo-coupons.html','MyWindow','toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=600,height=600'); return false;'>promo/coupon codes</a>.</strong>"
      hard_code_k3="<p style='clear:left'><img src='/lib/yhst-14044557065217/Product-Details.GIF' alt='Product Details' width='151' height='40' /></p><p style='border: 1px solid rgb(204, 204, 204); margin: 5px 0pt; padding: 0px;'></p><h3>"
      hard_code_l3="</h3>"
      hard_code_m3="<p style='clear:left'><img src='/lib/yhst-14044557065217/Related-Downloads.GIF' alt='Related Downloads' style='clear:left'width='151' height='40' /></p><p style='border: 1px solid rgb(204, 204, 204); margin: 5px 0pt; padding: 0px;'></p>"
      hard_code_h10="<table width='400' frame='void'>"
      hard_code_h14="<tr><td><img src='http://lib.store.yahoo.net/lib/yhst-14044557065217/PDFLOGO' alt='PDF LOGO' width='25' height='25' longdesc='PDF LOGO' /></td><td><a href='"
      hard_code_i14="'><strong>"
      hard_code_j14="</strong></a></td></tr>"
      hard_code_h19="</table>"
      hard_code_q3="<p style='clear:left'><a name='manufacturer-details'><img src='/lib/yhst-14044557065217/Manufacturer-Details.GIF' alt='Manufacturer Details' width='167' height='40' /></a></p><p style='border: 1px solid rgb(204, 204, 204); margin: 5px 0pt; padding: 0px;'></p><h3>About"
      hard_code_r3="</h3>"
      
      #'item details'!xez2&'item details'!xfa2   formula left

      hard_code_s3="<p style='clear:left'><img src='/lib/yhst-14044557065217/For-Your-Reference.GIF' alt='For-Your-Referrence' width='151' height='40' /></p><p style='border: 1px solid rgb(204, 204, 204); margin: 5px 0pt; padding: 0px;'></p>OUR SKU is"
      hard_code_t3="<br /><br />"
      hard_code_u3="is also sometimes referenced as:  <h4>"
      hard_code_v3="</h4>"
      caption+=(((self.promo_code_section_availablility)?(hardcode_c3):(""))+hard_code_k3+self.options+hard_code_l3+self.Item_description_with_html+((!self.url_link.url_link_1.blank?)?(hard_code_m3+hard_code_h10+hard_code_h14+self.url_link.url_link_1+hard_code_i14+self.text_anchor.anchor_text_1+hard_code_j14+hard_code_h19):("")))
      caption+=(!self.url_link.url_link_2.blank?)? (hard_code_h10+hard_code_h14+self.url_link.url_link_2+hard_code_i14+self.text_anchor.anchor_text_2+hard_code_j14+hard_code_h19):("")
      caption+=(!self.url_link.url_link_3.blank?)? (hard_code_h10+hard_code_h14+self.url_link.url_link_3+hard_code_i14+self.text_anchor.anchor_text_3+hard_code_j14+hard_code_h19):("")
      caption+=(!self.url_link.url_link_4.blank?)? (hard_code_h10+hard_code_h14+self.url_link.url_link_4+hard_code_i14+self.text_anchor.anchor_text_4+hard_code_j14+hard_code_h19):("")
      caption+=(!self.url_link.url_link_5.blank?)? (hard_code_h10+hard_code_h14+self.url_link.url_link_5+hard_code_i14+self.text_anchor.anchor_text_5+hard_code_j14+hard_code_h19):("")
      caption+=(!self.url_link.url_link_6.blank?)? (hard_code_h10+hard_code_h14+self.url_link.url_link_6+hard_code_i14+self.text_anchor.anchor_text_6+hard_code_j14+hard_code_h19):("")
      caption+=(!self.url_link.url_link_7.blank?)? (hard_code_h10+hard_code_h14+self.url_link.url_link_7+hard_code_i14+self.text_anchor.anchor_text_7+hard_code_j14+hard_code_h19):("")
      caption+=(!self.url_link.url_link_8.blank?)? (hard_code_h10+hard_code_h14+self.url_link.url_link_8+hard_code_i14+self.text_anchor.anchor_text_8+hard_code_j14+hard_code_h19):("")
      caption+=(!self.url_link.url_link_9.blank?)? (hard_code_h10+hard_code_h14+self.url_link.url_link_9+hard_code_i14+self.text_anchor.anchor_text_9+hard_code_j14+hard_code_h19):("")
      caption+=(!self.url_link.url_link_10.blank?)?(hard_code_h10+hard_code_h14+self.url_link.url_link_10+hard_code_i14+self.text_anchor.anchor_text_10+hard_code_j14+hard_code_h19):("")
      caption+=(hard_code_q3+self.manufacturer+hard_code_r3)
      caption+=(hard_code_s3+self.code)
      caption+=(!self.related_referrence_sku.blank?)? (hard_code_t3+self.name+hard_code_u3+self.related_referrence_sku+hard_code_v3):("")
      
      return caption

  end

  def output_sale_price
    	j3=((self.property.wholesale_cost+(15+(0.1*self.property.wholesale_cost)))*1.045)
      #r3=((self.property.wholesale_cost<20)?(2):((self.property.wholesale_cost<50)?(1.75):((self.property.wholesale_cost<150)?(1.5):((self.property.wholesale_cost<500)?(1.4):(1.25)))))/100
      r3=((self.property.wholesale_cost<20)?(2):((self.property.wholesale_cost<50)?(1.75):((self.property.wholesale_cost<150)?(1.5):((self.property.wholesale_cost<500)?(1.4):(1.25)))))*100
      cmp=Compscraper.find self.id rescue nil
      k3=cmp.minimum_lowest_price
      m3=(!self.free_shipping)?((((self.property.wholesale_cost*r3)<k3))?(k3-0.5):(self.property.wholesale_cost)):(((j3*r3)>k3)?(j3*r3):(k3-0.5))
      (self.property.map_pricing.to_f>(j3*r3))?(self.property.map_pricing.to_f):((self.price_override.blank?)?((m3<self.property.map_pricing)?(self.property.map_pricing):(m3)):(self.price_override))
  end

  def output_price
      output_sale_price*1.25
  end

  def output_ships_within_for_feed
      availability
  end

  def output_size_for_data_feeds
      property.overall_size
  end
  def output_profit
      (self.free_shipping)?(output_sale_price-((output_sale_price*0.04)+(self.property.wholesale_cost+(15+self.property.wholesale_cost*0.1)))):(output_sale_price+(Product.max_from_array([20+(self.property.actual_weight*0.45),((self.free_shipping)?(0):(15+(self.property.wholesale_cost*0.1))),0]))-((output_sale_price*0.04)+(self.property.wholesale_cost+(15+self.property.wholesale_cost*0.1))))
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
      0
  end

  def output_free_shipping
      free_shipping
  end

  def output_item
      (!manufacturer.blank? && !code.blank?)?(manufacturer+":"+code):("")
  end

  def output_purchase_description
      hard_code_aj2="------The Details Below will SUPERCEDE the Item Number if they conflict----- ------------------------------paste-options-here-------------------------------------------------------- ---Below-this-line-is-for-BudgetMailboxes-Use-Only-please-delete-before-processing-PO---  --------------------------------------------------------------------------------------------------------------- Special Instruction for Processing the PO:"
      manufacturer+":"+code+hard_code_aj2+po_description_detail
  end

  def output_et_right_cross
      related_Items
  end

  def output_et_right_break
      "For Sale at Discounted Prices Today. Order Online and SAVE!<br><br>"
  end
  def output_et_right_feature
  end

  def commercial_adjustment
      (self.property.wholesale_cost<20)?(0.99):((self.property.wholesale_cost<50)?(0.95):((self.property.wholesale_cost<150)?(0.92):((self.property.wholesale_cost<500)?(0.9):(0.85))))
  end

  def self.max_from_array(array)

    mxm = array[0];
    i=0
    while (i<array.length)
      if (array[i]>mxm)
        mxm = array[i];
      end
      i+=1
    end
    return mxm;
  end

  private
  def set_default_values
      self.price_override=0 if self.price_override.blank?
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
  end

  def capitalize_boolean_fields_text_value
      self.boolean_ups_approved_field=self.boolean_ups_approved_field.upcase rescue nil
      self.boolean_promo_code_section_availablility=self.boolean_promo_code_section_availablility.upcase rescue nil
      self.boolean_phone_number_visibility=self.boolean_phone_number_visibility.upcase rescue nil
      self.boolean_item_number_visiblity=self.boolean_item_number_visiblity.upcase rescue nil


  end

  def change_text_values_to_boolean
      self.is_usps_approved=true if self.boolean_ups_approved_field=="YES"
      self.promo_code_section_availablility=true if self.boolean_promo_code_section_availablility=="YES"
      self.phone_number_visibility=true if self.boolean_phone_number_visibility=="YES"
      self.item_number_visiblity=true if self.boolean_item_number_visiblity=="YES"


  end

end
