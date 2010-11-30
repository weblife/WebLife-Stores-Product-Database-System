class Inset < ActiveRecord::Base
  belongs_to :product

  validates_length_of :inset,:inset_2,:inset_3,:inset_4,:inset_5,:inset_6,:inset_7,:inset_8,:inset_9,
                      :maximum   => 60,
                      :allow_nil => true,
                      :too_long  => "must have at most 60 characters"

  


end
