# == Schema Information
#
# Table name: hard_code_informations
#
#  id                           :integer(4)      not null, primary key
#  promo_tag                    :text
#  backup_table_heading         :string(255)
#  backup_table_text            :text
#  where_pro_coming_open_tag    :text
#  pdf_logo_image_url           :text
#  open_table_tag               :text
#  open_table_tag_1_of_3        :text
#  open_table_tag_2_of_3        :text
#  open_table_tag_3_of_3        :text
#  close_table_tag              :text
#  where_pro_coming_mid_section :text
#  where_pro_coming_close_tag   :text
#  product_title_ot             :text
#  product_title_ct             :string(255)
#  related_downloads_ot         :text
#  re_dl_code_1_of_3            :text
#  re_dl_code_2_of_3            :text
#  re_dl_code_3_of_3            :text
#  re_dl_code_a1                :text
#  re_dl_code_a1_table          :text
#  re_dl_code_a2                :text
#  re_dl_code_a2_table          :text
#  man_title_ot                 :text
#  man_title_ct                 :text
#  reference_ot                 :text
#  reference_mid_tag            :string(255)
#  reference_mid_2              :string(255)
#  reference_end_tag            :string(255)
#  instructions                 :text
#  shipping_calculator          :text
#  return_detail_open           :text
#  return_detail_close          :string(255)
#

require 'test_helper'

class HardCodeInformationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
