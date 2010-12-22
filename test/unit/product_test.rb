# == Schema Information
#
# Table name: products
#
#  id                               :integer(4)      not null, primary key
#  user_id                          :integer(4)      not null
#  path                             :text
#  manufacturer                     :string(60)
#  code                             :string(20)
#  name                             :string(200)
#  warranty                         :string(200)
#  is_usps_approved                 :boolean(1)      default(FALSE)
#  image                            :string(60)
#  Item_description_with_html       :text
#  options                          :text
#  Item_description_without_html    :text
#  return_details                   :string(200)
#  availability                     :string(200)
#  shipping_time                    :string(200)
#  related_Items                    :string(100)
#  related_referrence_sku           :string(60)
#  promo_code_section_availablility :boolean(1)      default(FALSE)
#  disclaimer_name                  :string(60)
#  disclaimer_text                  :text
#  product_cmng_img_tag_html        :text
#  brief_summary_of_menu            :text
#  freight_cost_overide             :decimal(8, 2)   default(0.0)
#  po_description_details           :text
#  origin_zip                       :integer(4)      default(30087)
#  invalid_ship_methods             :integer(4)      default(101)
#  phone_number_visibility          :boolean(1)      default(FALSE)
#  item_number_visiblity            :boolean(1)      default(TRUE)
#  product_id                       :string(100)
#  created_at                       :datetime
#  updated_at                       :datetime
#  price_override                   :decimal(8, 2)   default(0.0)
#  active_status                    :string(255)     default("Active")
#  product_type                     :string(255)     default("Non-inventory Part")
#  cogs_account                     :string(255)     default("Cost of Goods Sold")
#  account                          :string(255)     default("Sales")
#  sales_tax_code                   :string(255)     default("Tax")
#  purchased_for_resale             :string(255)     default("y")
#  is_new                           :string(255)     default("New")
#  free_ship_method                 :integer(4)      default(1)
#  taxable                          :boolean(1)      default(TRUE)
#  ship_alone                       :boolean(1)      default(FALSE)
#  free_shipping                    :boolean(1)      default(FALSE)
#  po_description_detail            :string(255)     default("NONE")
#  commercial_free_shipping         :boolean(1)      default(FALSE)
#  streetsign_free_shipping         :boolean(1)      default(FALSE)
#  streetlights_free_shipping       :boolean(1)      default(FALSE)
#  addressplaq_free_shipping        :boolean(1)      default(FALSE)
#  commercial_adjustment            :decimal(8, 2)   default(0.0)
#  streetsign_adjustment            :decimal(8, 2)   default(0.0)
#  streetlights_adjustment          :decimal(8, 2)   default(0.0)
#  addressplaq_adjustment           :decimal(8, 2)   default(0.0)
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
