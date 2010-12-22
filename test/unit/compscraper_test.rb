# == Schema Information
#
# Table name: compscrapers
#
#  id                  :integer(4)      not null, primary key
#  user_id             :integer(4)      not null
#  item_search_phrase  :string(255)
#  word_that_occur     :string(255)
#  sort_options        :string(255)
#  lowest_price        :decimal(8, 2)   default(0.0)
#  decimal             :decimal(8, 2)   default(0.0)
#  second_lowest_price :decimal(8, 2)   default(0.0)
#  third_lowest_price  :decimal(8, 2)   default(0.0)
#  fourth_lowest_price :decimal(8, 2)   default(0.0)
#  fifth_lowest_price  :decimal(8, 2)   default(0.0)
#  sixth_lowest_price  :decimal(8, 2)   default(0.0)
#  lowest_site         :string(255)
#  second_lowest_site  :string(255)
#  third_lowest_site   :string(255)
#  fourth_lowest_site  :string(255)
#  fifth_lowest_site   :string(255)
#  sixth_lowest_site   :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#

require 'test_helper'

class CompscraperTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
