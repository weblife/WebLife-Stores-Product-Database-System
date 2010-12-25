# == Schema Information
#
# Table name: url_links
#
#  id          :integer(4)      not null, primary key
#  product_id  :integer(4)      not null
#  url_link_1  :string(255)
#  url_link_2  :string(255)
#  url_link_3  :string(255)
#  url_link_4  :string(255)
#  url_link_5  :string(255)
#  url_link_6  :string(255)
#  url_link_7  :string(255)
#  url_link_8  :string(255)
#  url_link_9  :string(255)
#  url_link_10 :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class UrlLinkTest < ActiveSupport::TestCase
  # Replace this with your real tests.
    def test_validations
        more_than_256_chars_string=generate_random_string(257)
        less_than_256_chars_string=generate_random_string(255)
        assert more_than_256_chars_string.length > 256
        assert less_than_256_chars_string.length < 256
        url_link=UrlLink.new
        assert url_link.valid?,"Empty fields are optional"

        url_link=UrlLink.new
        url_link.url_link_1=url_link.url_link_2=url_link.url_link_3=url_link.url_link_4=url_link.url_link_5=url_link.url_link_6=url_link.url_link_7=url_link.url_link_8=url_link.url_link_9=less_than_256_chars_string
        assert url_link.valid?
        
        urllink=UrlLink.new
        urllink.url_link_1=more_than_256_chars_string
        assert !urllink.valid?
        assert_equal urllink.errors.first[0],"url_link_1"
        assert_equal urllink.errors.first[1],"Url link 1 must have at most 256 characters"

        urllink=UrlLink.new
        urllink.url_link_2=more_than_256_chars_string
        assert !urllink.valid?
        assert_equal urllink.errors.first[0],"url_link_2"
        assert_equal urllink.errors.first[1],"Url link 2 must have at most 256 characters"

        urllink=UrlLink.new
        urllink.url_link_3=more_than_256_chars_string
        assert !urllink.valid?
        assert_equal urllink.errors.first[0],"url_link_3"
        assert_equal urllink.errors.first[1],"Url link 3 must have at most 256 characters"

        urllink=UrlLink.new
        urllink.url_link_4=more_than_256_chars_string
        assert !urllink.valid?
        assert_equal urllink.errors.first[0],"url_link_4"
        assert_equal urllink.errors.first[1],"Url link 4 must have at most 256 characters"

        urllink=UrlLink.new
        urllink.url_link_5=more_than_256_chars_string
        assert !urllink.valid?
        assert_equal urllink.errors.first[0],"url_link_5"
        assert_equal urllink.errors.first[1],"Url link 5 must have at most 256 characters"

        urllink=UrlLink.new
        urllink.url_link_6=more_than_256_chars_string
        assert !urllink.valid?
        assert_equal urllink.errors.first[0],"url_link_6"
        assert_equal urllink.errors.first[1],"Url link 6 must have at most 256 characters"

        urllink=UrlLink.new
        urllink.url_link_7=more_than_256_chars_string
        assert !urllink.valid?
        assert_equal urllink.errors.first[0],"url_link_7"
        assert_equal urllink.errors.first[1],"Url link 7 must have at most 256 characters"

        urllink=UrlLink.new
        urllink.url_link_8=more_than_256_chars_string
        assert !urllink.valid?
        assert_equal urllink.errors.first[0],"url_link_8"
        assert_equal urllink.errors.first[1],"Url link 8 must have at most 256 characters"

        urllink=UrlLink.new
        urllink.url_link_9=more_than_256_chars_string
        assert !urllink.valid?
        assert_equal urllink.errors.first[0],"url_link_9"
        assert_equal urllink.errors.first[1],"Url link 9 must have at most 256 characters"

        urllink=UrlLink.new
        urllink.url_link_10=more_than_256_chars_string
        assert !urllink.valid?
        assert_equal urllink.errors.first[0],"url_link_10"
        assert_equal urllink.errors.first[1],"Url link 10 must have at most 256 characters"
      
    end
end
