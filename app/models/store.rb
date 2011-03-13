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
  belongs_to :user
  validates_presence_of :name,:message=>"Name cannot be blank."
  validates_presence_of :store_url,:message=>"Store url cannot be blank.",:if=>:is_store?

  private

  def is_store?
      store_type=="1"
  end
end
