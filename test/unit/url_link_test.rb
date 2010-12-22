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
        url_link=UrlLink.new
        assert url_link.valid?,"Empty fields are options"
      
    end
end
