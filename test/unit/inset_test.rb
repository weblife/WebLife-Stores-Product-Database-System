# == Schema Information
#
# Table name: insets
#
#  id         :integer(4)      not null, primary key
#  product_id :integer(4)      not null
#  inset      :string(60)
#  inset_2    :string(60)
#  inset_3    :string(60)
#  inset_4    :string(60)
#  inset_5    :string(60)
#  inset_6    :string(60)
#  inset_7    :string(60)
#  inset_8    :string(60)
#  inset_9    :string(60)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class InsetTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_validations
    more_than_60_chars_string="1234567890123456789012345678901234567890asdfghjklqwertyuiopjh"
    less_than_60_chars_string="lessthan60"
    inset=Inset.new
    assert inset.valid?,"Empty fields are options"
    
    assert less_than_60_chars_string.length < 60
    inset.inset=inset.inset_2=inset.inset_3=inset.inset_4=inset.inset_5=inset.inset_6=inset.inset_7=inset.inset_8=inset.inset_9=less_than_60_chars_string
    assert inset.valid?,"Valid object"

    assert more_than_60_chars_string.length > 60
    
    inset=Inset.new
    inset.inset=more_than_60_chars_string
    assert !inset.valid?
    assert_equal inset.errors.first[0],"inset"
    assert_equal inset.errors.first[1],"must have at most 60 characters"


    inset=Inset.new
    inset.inset_2=more_than_60_chars_string
    assert !inset.valid?
    assert_equal inset.errors.first[0],"inset_2"
    assert_equal inset.errors.first[1],"must have at most 60 characters"

    inset=Inset.new
    inset.inset_3=more_than_60_chars_string
    assert !inset.valid?
    assert_equal inset.errors.first[0],"inset_3"
    assert_equal inset.errors.first[1],"must have at most 60 characters"


    inset=Inset.new
    inset.inset_4=more_than_60_chars_string
    assert !inset.valid?
    assert_equal inset.errors.first[0],"inset_4"
    assert_equal inset.errors.first[1],"must have at most 60 characters"


    inset=Inset.new
    inset.inset_5=more_than_60_chars_string
    assert !inset.valid?
    assert_equal inset.errors.first[0],"inset_5"
    assert_equal inset.errors.first[1],"must have at most 60 characters"


    inset=Inset.new
    inset.inset_6=more_than_60_chars_string
    assert !inset.valid?
    assert_equal inset.errors.first[0],"inset_6"
    assert_equal inset.errors.first[1],"must have at most 60 characters"


    inset=Inset.new
    inset.inset_7=more_than_60_chars_string
    assert !inset.valid?
    assert_equal inset.errors.first[0],"inset_7"
    assert_equal inset.errors.first[1],"must have at most 60 characters"


    inset=Inset.new
    inset.inset_8=more_than_60_chars_string
    assert !inset.valid?
    assert_equal inset.errors.first[0],"inset_8"
    assert_equal inset.errors.first[1],"must have at most 60 characters"


    inset=Inset.new
    inset.inset_9=more_than_60_chars_string
    assert !inset.valid?
    assert_equal inset.errors.first[0],"inset_9"
    assert_equal inset.errors.first[1],"must have at most 60 characters"

  end
end
