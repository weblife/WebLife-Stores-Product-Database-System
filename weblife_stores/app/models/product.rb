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

  # Custom model validation

  # Update the children to let them know they belong to the product this
  # is required since we validate children before the product is saved
  def initialize_children
    inset.product=self
    property.product=self
    text_anchor.product=self
    url_link.product=self
  end 

  validates_presence_of :id,:message=>"Id cannot be blank."
  validates_presence_of :image,:message=>"Image cannot be blank."
  validates_presence_of :Item_description_with_html,:message=>"Item Description - HTML cannot be blank."
  validates_presence_of :return_details,:message=>"Return details cannot be blank."
  validates_presence_of :availability,:message=>"Availability cannot be blank."
  validates_presence_of :shipping_time,:message=>"Shipping time cannot be blank."
  validates_uniqueness_of :id,:message=>"Id must be uniq."
  validates_numericality_of :freight_cost_overide,:message=>"Freight cost overide is not a number.",:allow_nil=>true
  validates_numericality_of :invalid_ship_methods,:only_integer=>true,:message=>"Invalid ship methods is not a number."
  validates_numericality_of :origin_zip,:only_integer=>true,:message=>"Origin Zip is not a number."

  validates_inclusion_of :is_usps_approved,:promo_code_section_availablility,:phone_number_visibility,:item_number_visiblity, :in => [true, false]

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
                file_path=upload_file_locally(file,current_user)
              else
                file_path=file
              end
              product_array=['path','id','Manufacturer','code','name','Warranty','Is this item USPS Approved?','Image','Item Description - HTML','Options','Item Description - NO HTML','return details','Availability','Shipping-Time','Related Items','Related Referrence Sku','Promo-Code Section Available','disclaimer-name','disclaimer-text','Where-Prod-Cmng-Img-Tag-HTML','Brief Summary of Manu.','Freight Cost Overide','PO Description Details','Origin-zip','Invalid-ship-methods','Phone-number','Item-number-visiblity']
              inset_array=['Inset','Inset-2','Inset-3','Inset-4','Inset-5','Inset-6','Inset-7','Inset-8','Inset-9']
              property_array=['material','style','color','actual-weight','ship-weight','overall-size','Wholesale Cost','MAP Pricing','Number-of-boxes','Multi-box-weights','Multi-box-dimensions']
              text_achor_array=['1st anchor text','2nd anchor text','3rd anchor text','4th anchor text','5th anchor text','6th anchor text','7th anchor text','8th anchor text','9th anchor text','10th anchor text']
              url_link_array=['1st url link','2nd url link','3rd url link','4th url link','5th url link','6th url link','7th url link','8th url link','9th url link','10th url link']



              sequenced_csv_array=['path','Manufacturer','code','name','Item Description - HTML','Options','actual-weight','ship-weight','material','style','color','overall-size','Wholesale Cost','MAP Pricing','Item Description - NO HTML','return details','Availability','Shipping-Time','Warranty','Is this item USPS Approved?','Image','Inset','Inset-2','Inset-3','Inset-4','Inset-5','Related Items','id','Related Referrence Sku','Promo-Code Section Available','Inset-6','Inset-7','Inset-8','Inset-9','disclaimer-name','disclaimer-text','1st url link','1st anchor text','2nd url link','2nd anchor text','3rd url link','3rd anchor text','4th url link','4th anchor text','5th url link','5th anchor text','6th url link','6th anchor text','7th url link','7th anchor text','8th url link','8th anchor text','9th url link','9th anchor text','10th url link','10th anchor text','Where-Prod-Cmng-Img-Tag-HTML','Brief Summary of Manu.','Freight Cost Overide','PO Description Details','Origin-zip','Number-of-boxes','Multi-box-weights','Multi-box-dimensions','Invalid-ship-methods','Phone-number','Item-number-visiblity']
              sequenced_db_array=['path','manufacturer','code','name','Item_description_with_html','options','actual_weight','ship_weight','material','style','color','overall_size','wholesale_cost','map_pricing','Item_description_without_html','return_details','availability','shipping_time','warranty','is_usps_approved','image','inset','inset_2','inset_3','inset_4','inset_5','related_Items','id','related_referrence_sku','promo_code_section_availablility','inset_6','inset_7','inset_8','inset_9','disclaimer_name','disclaimer_text','url_link_1','anchor_text_1','url_link_2','anchor_text_2','url_link_3','anchor_text_3','url_link_4','anchor_text_4','url_link_5','anchor_text_5','url_link_6','anchor_text_6','url_link_7','anchor_text_7','url_link_8','anchor_text_8','url_link_9','anchor_text_9','url_link_10','anchor_text_10','product_cmng_img_tag_html','brief_summary_of_menu','freight_cost_overide','po_description_details','origin_zip','number_of_boxes','multi_box_weights','multi_box_dimensions','invalid_ship_methods','phone_number_visibility','item_number_visiblity']
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
                  new_prod.id=prod["id"]
                  products_array << new_prod

                 end

                  count+=1
              end
              #File.delete(file_path)
              return products_array,file_path
        end


  def self.upload_file_locally file, user
    #begin
      ext_array = [".csv"]
      file_name= file.original_filename
      directory= "#{RAILS_ROOT}/public/input_files" #local directory path
      ext = File.extname(file_name)
      ext = ext.downcase
      if ext_array.include?(ext)
        local_path= File.join(directory,file_name)
        new_path= File.join(directory,"input_csv_#{user.id}")
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


end
