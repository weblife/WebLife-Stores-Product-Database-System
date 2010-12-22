# == Schema Information
#
# Table name: insets
#
#  id         :integer(4)      not null, primary key
#  product_id :integer(4)      not null
#  inset      :string(60)
#  inset_2    :string(60)
#  inset_3    :string(60)
#  inset_4    :string(60)
#  inset_5    :string(60)
#  inset_6    :string(60)
#  inset_7    :string(60)
#  inset_8    :string(60)
#  inset_9    :string(60)
#  created_at :datetime
#  updated_at :datetime
#

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
