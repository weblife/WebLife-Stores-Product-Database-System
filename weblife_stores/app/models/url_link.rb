class UrlLink < ActiveRecord::Base
  belongs_to :product

  validates_length_of :url_link_1,:url_link_2,:url_link_3,:url_link_4,:url_link_5,:url_link_6,:url_link_7,:url_link_8,:url_link_9,:url_link_10,
                      :allow_nil => true,
                      :maximum   => 256,
                      :too_long  => "must have at most 256 characters"

end
