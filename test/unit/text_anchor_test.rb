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
    def test_validations
        more_than_200_chars_string=generate_random_string(201)
        less_than_200_chars_string=generate_random_string(199)
        assert more_than_200_chars_string.length > 200
        assert less_than_200_chars_string.length < 200
        text_anchor=TextAnchor.new
        assert text_anchor.valid?,"Empty fields are optional"

        text_anchor=TextAnchor.new
        text_anchor.anchor_text_1=text_anchor.anchor_text_2=text_anchor.anchor_text_3=text_anchor.anchor_text_4=text_anchor.anchor_text_5=text_anchor.anchor_text_6=text_anchor.anchor_text_7=text_anchor.anchor_text_8=text_anchor.anchor_text_9=less_than_200_chars_string
        assert text_anchor.valid?


        text_anchor=TextAnchor.new
        text_anchor.anchor_text_1=more_than_200_chars_string
        assert !text_anchor.valid?
        assert_equal text_anchor.errors.first[0],"anchor_text_1"
        assert_equal text_anchor.errors.first[1],"Anchor text 1 must have at most 200 characters"

        text_anchor=TextAnchor.new
        text_anchor.anchor_text_2=more_than_200_chars_string
        assert !text_anchor.valid?
        assert_equal text_anchor.errors.first[0],"anchor_text_2"
        assert_equal text_anchor.errors.first[1],"Anchor text 2 must have at most 200 characters"

        text_anchor=TextAnchor.new
        text_anchor.anchor_text_3=more_than_200_chars_string
        assert !text_anchor.valid?
        assert_equal text_anchor.errors.first[0],"anchor_text_3"
        assert_equal text_anchor.errors.first[1],"Anchor text 3 must have at most 200 characters"

        text_anchor=TextAnchor.new
        text_anchor.anchor_text_4=more_than_200_chars_string
        assert !text_anchor.valid?
        assert_equal text_anchor.errors.first[0],"anchor_text_4"
        assert_equal text_anchor.errors.first[1],"Anchor text 4 must have at most 200 characters"

        text_anchor=TextAnchor.new
        text_anchor.anchor_text_5=more_than_200_chars_string
        assert !text_anchor.valid?
        assert_equal text_anchor.errors.first[0],"anchor_text_5"
        assert_equal text_anchor.errors.first[1],"Anchor text 5 must have at most 200 characters"

        text_anchor=TextAnchor.new
        text_anchor.anchor_text_6=more_than_200_chars_string
        assert !text_anchor.valid?
        assert_equal text_anchor.errors.first[0],"anchor_text_6"
        assert_equal text_anchor.errors.first[1],"Anchor text 6 must have at most 200 characters"

        text_anchor=TextAnchor.new
        text_anchor.anchor_text_7=more_than_200_chars_string
        assert !text_anchor.valid?
        assert_equal text_anchor.errors.first[0],"anchor_text_7"
        assert_equal text_anchor.errors.first[1],"Anchor text 7 must have at most 200 characters"

        text_anchor=TextAnchor.new
        text_anchor.anchor_text_8=more_than_200_chars_string
        assert !text_anchor.valid?
        assert_equal text_anchor.errors.first[0],"anchor_text_8"
        assert_equal text_anchor.errors.first[1],"Anchor text 8 must have at most 200 characters"

        text_anchor=TextAnchor.new
        text_anchor.anchor_text_9=more_than_200_chars_string
        assert !text_anchor.valid?
        assert_equal text_anchor.errors.first[0],"anchor_text_9"
        assert_equal text_anchor.errors.first[1],"Anchor text 9 must have at most 200 characters"

        text_anchor=TextAnchor.new
        text_anchor.anchor_text_10=more_than_200_chars_string
        assert !text_anchor.valid?
        assert_equal text_anchor.errors.first[0],"anchor_text_10"
        assert_equal text_anchor.errors.first[1],"Anchor text 10 must have at most 200 characters"

  end
end
