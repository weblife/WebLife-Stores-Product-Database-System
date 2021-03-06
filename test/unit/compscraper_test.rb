# == Schema Information
#
# Table name: compscrapers
#
#  id                 :integer(4)      not null, primary key
#  user_id            :integer(4)      not null
#  item_search_phrase :string(255)
#  word_that_occur    :string(255)
#  sort_options       :string(255)
#  lowest_price       :decimal(8, 2)   default(0.0)
#  decimal            :decimal(8, 2)   default(0.0)
#  lowest_price_2     :decimal(8, 2)   default(0.0)
#  lowest_price_3     :decimal(8, 2)   default(0.0)
#  lowest_price_4     :decimal(8, 2)   default(0.0)
#  lowest_price_5     :decimal(8, 2)   default(0.0)
#  lowest_price_6     :decimal(8, 2)   default(0.0)
#  lowest_site        :string(255)
#  lowest_site_2      :string(255)
#  lowest_site_3      :string(255)
#  lowest_site_4      :string(255)
#  lowest_site_5      :string(255)
#  lowest_site_6      :string(255)
#  created_at         :datetime
#  updated_at         :datetime
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
        cps.lowest_site_2=generate_random_string(101)
        assert !cps.valid?
        assert_equal cps.errors.first[0],"lowest_site_2"
        assert_equal cps.errors.first[1],"2nd lowest site must have at most 100 characters"

        cps=Compscraper.new
        cps.lowest_site_3=generate_random_string(101)
        assert !cps.valid?
        assert_equal cps.errors.first[0],"lowest_site_3"
        assert_equal cps.errors.first[1],"3rd lowest site must have at most 100 characters"

        cps=Compscraper.new
        cps.lowest_site_4=generate_random_string(101)
        assert !cps.valid?
        assert_equal cps.errors.first[0],"lowest_site_4"
        assert_equal cps.errors.first[1],"4th lowest site must have at most 100 characters"

        cps=Compscraper.new
        cps.lowest_site_5=generate_random_string(101)
        assert !cps.valid?
        assert_equal cps.errors.first[0],"lowest_site_5"
        assert_equal cps.errors.first[1],"5th lowest site must have at most 100 characters"

        cps=Compscraper.new
        cps.lowest_site_6=generate_random_string(101)
        assert !cps.valid?
        assert_equal cps.errors.first[0],"lowest_site_6"
        assert_equal cps.errors.first[1],"6th lowest site must have at most 100 characters"

  end
end
