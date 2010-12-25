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

require 'test_helper'

class PropertyTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_validations
        property=Property.new
        assert property.valid?

        property=Property.new
        property.material=generate_random_string(31)
        assert !property.valid?
        assert_equal property.errors.first[0],"material"
        assert_equal property.errors.first[1],"Material must have at most 30 characters"

        property=Property.new
        property.style=generate_random_string(31)
        assert !property.valid?
        assert_equal property.errors.first[0],"style"
        assert_equal property.errors.first[1],"style must have at most 30 characters"

        property=Property.new
        property.color=generate_random_string(31)
        assert !property.valid?
        assert_equal property.errors.first[0],"color"
        assert_equal property.errors.first[1],"Color must have at most 30 characters"

        property=Property.new
        property.overall_size=generate_random_string(201)
        assert !property.valid?
        assert_equal property.errors.first[0],"overall_size"
        assert_equal property.errors.first[1],"Overall size must have at most 200 characters"

        property=Property.new
        property.multi_box_dimensions=generate_random_string(257)
        assert !property.valid?
        assert_equal property.errors.first[0],"multi_box_dimensions"
        assert_equal property.errors.first[1],"Multi box dimensions must have at most 256 characters"

        property=Property.new
        property.actual_weight=generate_random_string(2)
        assert !property.valid?
        assert_equal property.errors.first[0],"actual_weight"
        assert_equal property.errors.first[1],"Actuall weight is not a number."

        property=Property.new
        property.ship_weight=generate_random_string(2)
        assert !property.valid?
        assert_equal property.errors.first[0],"ship_weight"
        assert_equal property.errors.first[1],"Ship weight is not a number."

        property=Property.new
        property.wholesale_cost=generate_random_string(2)
        assert !property.valid?
        assert_equal property.errors.first[0],"wholesale_cost"
        assert_equal property.errors.first[1],"Wholesale cost is not a number."

        property=Property.new
        property.map_pricing=generate_random_string(2)
        assert !property.valid?
        assert_equal property.errors.first[0],"map_pricing"
        assert_equal property.errors.first[1],"Map pricing is not a number."

        property=Property.new
        property.multi_box_weights=generate_random_string(2)
        assert !property.valid?
        assert_equal property.errors.first[0],"multi_box_weights"
        assert_equal property.errors.first[1],"Multi box weights is not a number."

        property=Property.new
        property.number_of_boxes=generate_random_string(2)
        assert !property.valid?
        assert_equal property.errors.first[0],"number_of_boxes"
        assert_equal property.errors.first[1],"Number of boxes is not a number."

  end
end
