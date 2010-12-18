require 'test_helper'

class UrlLinkTest < ActiveSupport::TestCase
  # Replace this with your real tests.
    def test_validations
        url_link=UrlLink.new
        assert url_link.valid?,"Empty fields are options"
      
    end
end
