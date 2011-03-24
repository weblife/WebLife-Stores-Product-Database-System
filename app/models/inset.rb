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
end
