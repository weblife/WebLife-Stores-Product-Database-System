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
  def test_validations
        cps=Compscraper.new
        assert cps.valid?

        cps=Compscraper.new
        cps.item_search_phrase=generate_random_string(101)
        assert !cps.valid?
        assert_equal cps.errors.first[0],"item_search_phrase"
        assert_equal cps.errors.first[1],"Search item phrase must have at most 100 characters"

        cps=Compscraper.new
        cps.word_that_occur=generate_random_string(101)
        assert !cps.valid?
        assert_equal cps.errors.first[0],"word_that_occur"
        assert_equal cps.errors.first[1],"word that occur must have at most 100 characters"

        cps=Compscraper.new
        cps.sort_options=generate_random_string(101)
        assert !cps.valid?
        assert_equal cps.errors.first[0],"sort_options"
        assert_equal cps.errors.first[1],"Sort options must have at most 100 characters"

        cps=Compscraper.new
        cps.lowest_site=generate_random_string(101)
        assert !cps.valid?
        assert_equal cps.errors.first[0],"lowest_site"
        assert_equal cps.errors.first[1],"Lowest site must have at most 100 characters"

        cps=Compscraper.new
        cps.second_lowest_site=generate_random_string(101)
        assert !cps.valid?
        assert_equal cps.errors.first[0],"second_lowest_site"
        assert_equal cps.errors.first[1],"2nd lowest site must have at most 100 characters"

        cps=Compscraper.new
        cps.third_lowest_site=generate_random_string(101)
        assert !cps.valid?
        assert_equal cps.errors.first[0],"third_lowest_site"
        assert_equal cps.errors.first[1],"3rd lowest site must have at most 100 characters"

        cps=Compscraper.new
        cps.fourth_lowest_site=generate_random_string(101)
        assert !cps.valid?
        assert_equal cps.errors.first[0],"fourth_lowest_site"
        assert_equal cps.errors.first[1],"4th lowest site must have at most 100 characters"

        cps=Compscraper.new
        cps.fifth_lowest_site=generate_random_string(101)
        assert !cps.valid?
        assert_equal cps.errors.first[0],"fifth_lowest_site"
        assert_equal cps.errors.first[1],"5th lowest site must have at most 100 characters"

        cps=Compscraper.new
        cps.sixth_lowest_site=generate_random_string(101)
        assert !cps.valid?
        assert_equal cps.errors.first[0],"sixth_lowest_site"
        assert_equal cps.errors.first[1],"6th lowest site must have at most 100 characters"

  end
end
