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
  test "the truth" do
    assert true
  end
end
