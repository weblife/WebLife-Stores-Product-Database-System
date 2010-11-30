class Product < ActiveRecord::Base
  belongs_to :user
  has_one :inset, :dependent => :destroy
  has_one :property, :dependent => :destroy
  has_one :text_anchor, :dependent => :destroy
  has_one :url_link, :dependent => :destroy

  validates_presence_of :id,:image,:Item_description_with_html,:return_details,:availability,:shipping_time
  validates_uniqueness_of :id
  validates_numericality_of :freight_cost_overide
  validates_numericality_of :origin_zip,:invalid_ship_methods,:only_integer=>true

  validates_inclusion_of :is_usps_approved,:promo_code_section_availablility,:phone_number_visibility,:item_number_visiblity, :in => [true, false]

  validates_length_of :path,
                      :allow_nil => true,
                      :maximum   => 400,
                      :too_long  => "must have at most 400 characters"
  validates_length_of :manufacturer,
                      :allow_nil => true,
                      :maximum   => 60,
                      :too_long  => "must have at most 60 characters"
  validates_length_of :code,
                      :allow_nil => true,
                      :maximum   => 20,
                      :too_long  => "must have at most 20 characters"
  validates_length_of :name,
                      :allow_nil => true,
                      :maximum   => 200,
                      :too_long  => "must have at most 200 characters"

  validates_length_of :warranty,
                      :allow_nil => true,
                      :maximum   => 200,
                      :too_long  => "must have at most 200 characters"
                    
  validates_length_of :image,
                      :maximum   => 60,
                      :too_long  => "must have at most 60 characters"

  validates_length_of :Item_description_without_html,
                      :allow_nil => true,
                      :maximum   => 500,
                      :too_long  => "must have at most 500 characters"

  validates_length_of :return_details,
                      :maximum   => 200,
                      :too_long  => "must have at most 200 characters"

  validates_length_of :availability,
                      :maximum   => 200,
                      :too_long  => "must have at most 200 characters"

  validates_length_of :shipping_time,
                      :maximum   => 200,
                      :too_long  => "must have at most 200 characters"

  validates_length_of :related_Items,
                      :allow_nil => true,
                      :maximum   => 100,
                      :too_long  => "must have at most 100 characters"

  validates_length_of :related_referrence_sku,
                      :allow_nil => true,
                      :maximum   => 60,
                      :too_long  => "must have at most 60 characters"

  validates_length_of :disclaimer_name,
                      :allow_nil => true,
                      :maximum   => 60,
                      :too_long  => "must have at most 60 characters"

  validates_length_of :disclaimer_text,
                      :allow_nil => true,
                      :maximum   => 400,
                      :too_long  => "must have at most 400 characters"

  validates_length_of :product_cmng_img_tag_html,
                      :allow_nil => true,
                      :maximum   => 400,
                      :too_long  => "must have at most 400 characters"


end
