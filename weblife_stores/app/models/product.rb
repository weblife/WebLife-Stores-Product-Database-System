class Product < ActiveRecord::Base
  belongs_to :user
  has_one :inset, :dependent => :destroy
  has_one :property, :dependent => :destroy
  has_one :text_anchor, :dependent => :destroy
  has_one :url_link, :dependent => :destroy
end
