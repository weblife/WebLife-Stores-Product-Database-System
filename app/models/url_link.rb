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

class UrlLink < ActiveRecord::Base
  belongs_to :product

  validates_length_of :url_link_1,
                      :allow_nil => true,
                      :maximum   => 256,
                      :too_long  => "Url link 1 must have at most 256 characters"
  validates_length_of :url_link_2,
                      :allow_nil => true,
                      :maximum   => 256,
                      :too_long  => "Url link 2 must have at most 256 characters"
  validates_length_of :url_link_3,
                      :allow_nil => true,
                      :maximum   => 256,
                      :too_long  => "Url link 3 must have at most 256 characters"
  validates_length_of :url_link_4,
                      :allow_nil => true,
                      :maximum   => 256,
                      :too_long  => "Url link 4 must have at most 256 characters"
  validates_length_of :url_link_5,
                      :allow_nil => true,
                      :maximum   => 256,
                      :too_long  => "Url link 5 must have at most 256 characters"
  validates_length_of :url_link_6,
                      :allow_nil => true,
                      :maximum   => 256,
                      :too_long  => "Url link 6 must have at most 256 characters"
  validates_length_of :url_link_7,
                      :allow_nil => true,
                      :maximum   => 256,
                      :too_long  => "Url link 7 must have at most 256 characters"
  validates_length_of :url_link_8,
                      :allow_nil => true,
                      :maximum   => 256,
                      :too_long  => "Url link 8 must have at most 256 characters"
  validates_length_of :url_link_9,
                      :allow_nil => true,
                      :maximum   => 256,
                      :too_long  => "Url link 9 must have at most 256 characters"
  validates_length_of :url_link_10,
                      :allow_nil => true,
                      :maximum   => 256,
                      :too_long  => "Url link 10 must have at most 256 characters"

end
