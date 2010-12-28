# == Schema Information
#
# Table name: properties
#
#  id                   :integer(4)      not null, primary key
#  product_id           :integer(4)      not null
#  material             :string(30)
#  style                :string(30)
#  color                :string(30)
#  actual_weight        :decimal(8, 2)   default(0.0)
#  ship_weight          :decimal(8, 2)   default(0.0)
#  overall_size         :string(200)
#  wholesale_cost       :decimal(8, 2)   default(0.0)
#  map_pricing          :decimal(8, 2)   default(0.0)
#  number_of_boxes      :integer(4)      default(1)
#  multi_box_weights    :decimal(8, 2)   default(0.0)
#  multi_box_dimensions :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#

class Property < ActiveRecord::Base
  belongs_to :product

  validates_presence_of :actual_weight,:message=>"Actual weight cannot be blank."
  validates_presence_of :ship_weight,:message=>"Ship weight cannot be blank."
  validates_presence_of :wholesale_cost,:message => "Wholesale cost cannot be blank."
  validates_presence_of :map_pricing,:message => "Map pricing cannot be blank."
  
  validates_numericality_of :actual_weight,:message=>"Actuall weight is not a number."
  validates_numericality_of :ship_weight,:message=>"Ship weight is not a number."
  validates_numericality_of :wholesale_cost,:message=>"Wholesale cost is not a number."
  validates_numericality_of :map_pricing,:message=>"Map pricing is not a number."
  validates_numericality_of :multi_box_weights,:message=>"Multi box weights is not a number."
  validates_numericality_of :number_of_boxes,:only_integer=>true,:message=>"Number of boxes is not a number."
  
  validates_length_of :material,:allow_nil => true,:maximum   => 30,:too_long  => "Material must have at most 30 characters"
  validates_length_of :style,:allow_nil => true,:maximum   => 30,:too_long  => "style must have at most 30 characters"
  validates_length_of :color,:allow_nil => true,:maximum   => 30,:too_long  => "Color must have at most 30 characters"
  validates_length_of :overall_size,:allow_nil => true,:maximum   => 200,:too_long  => "Overall size must have at most 200 characters"
  validates_length_of :multi_box_dimensions,:allow_nil => true,:maximum   => 256,:too_long  => "Multi box dimensions must have at most 256 characters"

end
