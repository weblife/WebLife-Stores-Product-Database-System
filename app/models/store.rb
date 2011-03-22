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
  validates_presence_of :name,:message=>"cannot be blank."
  validates_presence_of :store_url,:message=>"cannot be blank.",:if=>:is_store?
  before_save :strip_name

  def self.find_normal_stores
      find :all,:conditions=>["is_compscraper_related=?",false]
  end
  def self.find_compscraper_stores
      find :all,:conditions=>["is_compscraper_related=?",true]
  end
  private

  def is_store?
      store_type.to_s=="1" && !is_compscraper_related
  end
  def strip_name
      self.name=name.strip if !name.blank?
  end
end
