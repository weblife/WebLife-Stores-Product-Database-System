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

class Store < ActiveRecord::Base
end
