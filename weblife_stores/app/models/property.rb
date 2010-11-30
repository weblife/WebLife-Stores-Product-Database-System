class Property < ActiveRecord::Base
  belongs_to :product

  validates_presence_of :actual_weight,:ship_weight,:wholesale_cost,:map_pricing
  validates_numericality_of :actual_weight,:ship_weight,:wholesale_cost,:map_pricing,:multi_box_weights
  validates_numericality_of :number_of_boxes,:only_integer=>true
  validates_length_of :material,
                      :allow_nil => true,
                      :maximum   => 30,
                      :too_long  => "must have at most 30 characters"

  validates_length_of :style,
                      :allow_nil => true,
                      :maximum   => 30,
                      :too_long  => "must have at most 30 characters"
  validates_length_of :color,
                      :allow_nil => true,
                      :maximum   => 30,
                      :too_long  => "must have at most 30 characters"

  validates_length_of :overall_size,
                      :allow_nil => true,
                      :maximum   => 200,
                      :too_long  => "must have at most 200 characters"

  validates_length_of :multi_box_dimensions,
                      :allow_nil => true,
                      :maximum   => 256,
                      :too_long  => "must have at most 256 characters"

end
