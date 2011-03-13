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

  
  validates_numericality_of :actual_weight,:message=>"Actuall weight is not a number.",:allow_nil=>true
  validates_numericality_of :ship_weight,:message=>"Ship weight is not a number.",:allow_nil=>true
  validates_numericality_of :wholesale_cost,:message=>"Wholesale cost is not a number.",:allow_nil=>true
  validates_numericality_of :map_pricing,:message=>"Map pricing is not a number.",:allow_nil=>true
  validates_numericality_of :number_of_boxes,:only_integer=>true,:message=>"Number of boxes is not a number.",:allow_nil=>true
  
  validates_length_of :material,:allow_nil => true,:maximum   => 30,:too_long  => "Material must have at most 30 characters"
  validates_length_of :style,:allow_nil => true,:maximum   => 30,:too_long  => "style must have at most 30 characters"
  validates_length_of :color,:allow_nil => true,:maximum   => 30,:too_long  => "Color must have at most 30 characters"
  validates_length_of :overall_size,:allow_nil => true,:maximum   => 200,:too_long  => "Overall size must have at most 200 characters"
  validates_length_of :multi_box_dimensions,:allow_nil => true,:maximum   => 256,:too_long  => "Multi box dimensions must have at most 256 characters"
  validate :compare_price

  private
  def compare_price
      errors.add(:wholesale_cost,"Price Override must be GREATER than Wholesale Price.") if product.price_override.to_f!=0 && wholesale_cost.to_f!=0 && product.price_override.to_f< wholesale_cost.to_f
  end

end
