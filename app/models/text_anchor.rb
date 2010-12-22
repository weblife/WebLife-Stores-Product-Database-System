# == Schema Information
#
# Table name: text_anchors
#
#  id             :integer(4)      not null, primary key
#  product_id     :integer(4)      not null
#  anchor_text_1  :string(200)
#  anchor_text_2  :string(200)
#  anchor_text_3  :string(200)
#  anchor_text_4  :string(200)
#  anchor_text_5  :string(200)
#  anchor_text_6  :string(200)
#  anchor_text_7  :string(200)
#  anchor_text_8  :string(200)
#  anchor_text_9  :string(200)
#  anchor_text_10 :string(200)
#  created_at     :datetime
#  updated_at     :datetime
#

class TextAnchor < ActiveRecord::Base
  belongs_to :product

  validates_length_of :anchor_text_1,
                      :allow_nil => true,
                      :maximum   => 200,
                      :too_long  => "Anchor text 1 must have at most 200 characters"
  validates_length_of :anchor_text_2,
                      :allow_nil => true,
                      :maximum   => 200,
                      :too_long  => "Anchor text 2 must have at most 200 characters"
  validates_length_of :anchor_text_3,
                      :allow_nil => true,
                      :maximum   => 200,
                      :too_long  => "Anchor text 3 must have at most 200 characters"
  validates_length_of :anchor_text_4,
                      :allow_nil => true,
                      :maximum   => 200,
                      :too_long  => "Anchor text 4 must have at most 200 characters"
  validates_length_of :anchor_text_5,
                      :allow_nil => true,
                      :maximum   => 200,
                      :too_long  => "Anchor text 5 must have at most 200 characters"
  validates_length_of :anchor_text_6,
                      :allow_nil => true,
                      :maximum   => 200,
                      :too_long  => "Anchor text 6 must have at most 200 characters"
  validates_length_of :anchor_text_7,
                      :allow_nil => true,
                      :maximum   => 200,
                      :too_long  => "Anchor text 7 must have at most 200 characters"
  validates_length_of :anchor_text_8,
                      :allow_nil => true,
                      :maximum   => 200,
                      :too_long  => "Anchor text 8 must have at most 200 characters"
  validates_length_of :anchor_text_9,
                      :allow_nil => true,
                      :maximum   => 200,
                      :too_long  => "Anchor text 9 must have at most 200 characters"
  validates_length_of :anchor_text_10,
                      :allow_nil => true,
                      :maximum   => 200,
                      :too_long  => "Anchor text 10 must have at most 200 characters"

end
