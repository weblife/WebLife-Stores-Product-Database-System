# == Schema Information
#
# Table name: stores
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  name       :string(255)
#  store_url  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
