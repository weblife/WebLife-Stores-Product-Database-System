class TextAnchor < ActiveRecord::Base
  belongs_to :product

  validates_length_of :anchor_text_1,:anchor_text_2,:anchor_text_3,:anchor_text_4,:anchor_text_5,:anchor_text_6,:anchor_text_7,:anchor_text_8,:anchor_text_9,:anchor_text_10,
                      :allow_nil => true,
                      :maximum   => 200,
                      :too_long  => "must have at most 200 characters"

end
