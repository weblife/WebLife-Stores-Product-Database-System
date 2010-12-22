# == Schema Information
#
# Table name: text_anchors
#
#  id             :integer(4)      not null, primary key
#  product_id     :integer(4)      not null
#  anchor_text_1  :string(200)
#  anchor_text_2  :string(200)
#  anchor_text_3  :string(200)
#  anchor_text_4  :string(200)
#  anchor_text_5  :string(200)
#  anchor_text_6  :string(200)
#  anchor_text_7  :string(200)
#  anchor_text_8  :string(200)
#  anchor_text_9  :string(200)
#  anchor_text_10 :string(200)
#  created_at     :datetime
#  updated_at     :datetime
#

require 'test_helper'

class TextAnchorTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
