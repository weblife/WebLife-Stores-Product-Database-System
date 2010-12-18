class Inset < ActiveRecord::Base
  belongs_to :product

  validates_length_of :inset,
                      :maximum   => 60,
                      :allow_nil => true,
                      :too_long  => "Inset must have at most 60 characters"

  validates_length_of :inset_2,
                      :maximum   => 60,
                      :allow_nil => true,
                      :too_long  => "Inset 2 must have at most 60 characters"

  validates_length_of :inset_3,
                      :maximum   => 60,
                      :allow_nil => true,
                      :too_long  => "Inset 3 must have at most 60 characters"

  validates_length_of :inset_4,
                      :maximum   => 60,
                      :allow_nil => true,
                      :too_long  => "Inset 4 must have at most 60 characters"

  validates_length_of :inset_5,
                      :maximum   => 60,
                      :allow_nil => true,
                      :too_long  => "Inset 5 must have at most 60 characters"

  validates_length_of :inset_6,
                      :maximum   => 60,
                      :allow_nil => true,
                      :too_long  => "Inset 6 must have at most 60 characters"

  validates_length_of :inset_7,
                      :maximum   => 60,
                      :allow_nil => true,
                      :too_long  => "Inset 7 must have at most 60 characters"

  validates_length_of :inset_8,
                      :maximum   => 60,
                      :allow_nil => true,
                      :too_long  => "Inset 8 must have at most 60 characters"

  validates_length_of :inset_9,
                      :maximum   => 60,
                      :allow_nil => true,
                      :too_long  => "Inset 9 must have at most 60 characters"

  


end
