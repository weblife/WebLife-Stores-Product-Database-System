class CreateStores < ActiveRecord::Migration
  def self.up
    create_table :stores do |t|
      t.integer :user_id
      t.string :name
      t.string :store_url
      t.timestamps
    end

    create_table :hard_code_informations do |t|
      t.text :promo_tag
      t.string :backup_table_heading
      t.text :backup_table_text
      t.text :where_pro_coming_open_tag
      t.text :pdf_logo_image_url
      t.text :open_table_tag
      t.text :open_table_tag_1_of_3
      t.text :open_table_tag_2_of_3
      t.text :open_table_tag_3_of_3
      t.text :close_table_tag
      t.text :where_pro_coming_mid_section
      t.text :where_pro_coming_close_tag
      t.text :product_title_ot
      t.string :product_title_ct
      t.text :related_downloads_ot
      t.text :re_dl_code_1_of_3
      t.text :re_dl_code_2_of_3
      t.text :re_dl_code_3_of_3
      t.text :re_dl_code_a1
      t.text :re_dl_code_a1_table
      t.text :re_dl_code_a2
      t.text :re_dl_code_a2_table
      t.text :man_title_ot
      t.text :man_title_ct
      t.text :reference_ot
      t.string :reference_mid_tag
      t.string :reference_mid_2
      t.string :reference_end_tag
      t.text :instructions
      t.text :shipping_calculator
      t.text :return_detail_open
      t.string :return_detail_close

    end

    hci=HardCodeInformation.new
    hci.promo_tag="<p style=\"clear:left\"><img src=\"/lib/yhst-14044557065217/Promo-Offer.GIF\" alt=\"Promo Offer\" width=\"131\" height=\"35\" /></p><p style=\"border: 1px solid rgb(204, 204, 204); margin: 5px 0pt; padding: 0px;\"></p><strong>View all current <a href=\"#\" onclick=\"mywindow=window.open('promo-coupons.html','MyWindow','toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=600,height=600'); return false;\">promo/coupon codes</a>.</strong>"
    hci.backup_table_heading="BACKUP TABLE"
    hci.backup_table_text="<table width=\"400\" frame=\"void\"><tr><td><img src=\"http://lib.store.yahoo.net/lib/yhst-14044557065217/PDFLOGO\" alt=\"PDF LOGO\" width=\"25\" height=\"25\" longdesc=\"PDF LOGO\" /></td><td><a href=\"http://www.budgetmailboxes.com/auth-florence-cbu-mailbox-1570-cluster-box-unit--8-box-unit--1570-8af.html#\"><strong>Product Installation Instruction </strong></a></td></tr><tr><td><img src=\"http://lib.store.yahoo.net/lib/yhst-14044557065217/PDFLOGO\" alt=\"PDF LOGO\" width=\"25\" height=\"25\" longdesc=\"PDF LOGO\" /></td><td><a href=\"http://www.budgetmailboxes.com/auth-florence-cbu-mailbox-1570-cluster-box-unit--8-box-unit--1570-8af.html#\"><strong>Product Additional Details </strong></a></td></tr><tr><td><img src=\"http://lib.store.yahoo.net/lib/yhst-14044557065217/PDFLOGO\" alt=\"PDF LOGO\" width=\"25\" height=\"25\" longdesc=\"PDF LOGO\" /></td><td><a href=\"http://www.budgetmailboxes.com/auth-florence-cbu-mailbox-1570-cluster-box-unit--8-box-unit--1570-8af.html#\"><strong>Product Additional Details </strong></a></td></tr><tr><td><img src=\"http://lib.store.yahoo.net/lib/yhst-14044557065217/PDFLOGO\" alt=\"PDF LOGO\" width=\"25\" height=\"25\" longdesc=\"PDF LOGO\" /></td><td><a href=\"http://www.budgetmailboxes.com/auth-florence-cbu-mailbox-1570-cluster-box-unit--8-box-unit--1570-8af.html#\"><strong>Product Additional Details </strong></a></td></tr><tr><td><img src=\"http://lib.store.yahoo.net/lib/yhst-14044557065217/PDFLOGO\" alt=\"PDF LOGO\" width=\"25\" height=\"25\" longdesc=\"PDF LOGO\" /></td><td><a href=\"http://www.budgetmailboxes.com/auth-florence-cbu-mailbox-1570-cluster-box-unit--8-box-unit--1570-8af.html#\"><strong>Product Additional Details </strong></a></td></tr><tr><td><img src=\"http://lib.store.yahoo.net/lib/yhst-14044557065217/PDFLOGO\" alt=\"PDF LOGO\" width=\"25\" height=\"25\" longdesc=\"PDF LOGO\" /></td><td><a href=\"http://www.budgetmailboxes.com/auth-florence-cbu-mailbox-1570-cluster-box-unit--8-box-unit--1570-8af.html#\"><strong>Product Additional Information </strong></a></td></tr></table>"
    hci.where_pro_coming_open_tag="<p style=\"clear:left\"><img src=\"/lib/yhst-14044557065217/Where-is-the-Product-Made.GIF\" alt=\"Where is the Product Made\" width=\"200\" height=\"40\" /></p><p style=\"border: 1px solid rgb(204, 204, 204); margin: 5px 0pt; padding: 0px;\"></p>"
    hci.pdf_logo_image_url="<img src=\"http://lib.store.yahoo.net/lib/yhst-14044557065217/PDFLOGO\" alt=\"PDF LOGO\" width=\"25\" height=\"25\" longdesc=\"PDF LOGO\" />"
    hci.open_table_tag="<table width=\"400\" frame=\"void\">"
    hci.open_table_tag_1_of_3="<tr><td><img src=\"http://lib.store.yahoo.net/lib/yhst-14044557065217/PDFLOGO\" alt=\"PDF LOGO\" width=\"25\" height=\"25\" longdesc=\"PDF LOGO\" /></td><td><a href=\""
    hci.open_table_tag_2_of_3="\"><strong>"
    hci.open_table_tag_3_of_3="</strong></a></td></tr>"
    hci.close_table_tag="</table>"
    hci.where_pro_coming_close_tag="<a href=\"#\" onclick=\"mywindow=window.open('http://www.budgetmailboxes.com/architecturalmailboxes.html','MyWindow','toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=600,height=600'); return false;\">learn more about the manufacturer</a></p>"
    hci.product_title_ot="<p style=\"clear:left\"><img src=\"/lib/yhst-14044557065217/Product-Details.GIF\" alt=\"Product Details\" width=\"151\" height=\"40\" /></p><p style=\"border: 1px solid rgb(204, 204, 204); margin: 5px 0pt; padding: 0px;\"></p><h3>"
    hci.product_title_ct="</h3>"
    hci.related_downloads_ot="<p style=\"clear:left\"><img src=\"/lib/yhst-14044557065217/Related-Downloads.GIF\" alt=\"Related Downloads\" style=\"clear:left\" width=\"151\" height=\"40\" /></p><p style=\"border: 1px solid rgb(204, 204, 204); margin: 5px 0pt; padding: 0px;\"></p>"
    hci.re_dl_code_1_of_3="<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td width=\"50%\"><p align=\"center\"> <font color=\"blue\" size=\"3\">Need More Product Details? </font><br><font color=\"blue\"> Click below image for Printable PDF <br> Allow 30 Seconds to Download</font></p></td><td width=\"50%\"><p align=\"center\"> <font color=\"blue\" size=\"3\">Need Installation Details? </font><br><font color=\"blue\"> Click below image for Printable PDF <br> Allow 30 Seconds to Download </font></p></td></tr><tr><td width=\"50%\"><p align=\"center\"> <a href=\"#\" onclick=\"mywindow=window.open('"
    hci.re_dl_code_2_of_3="','MyWindow','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,width=650,height=700,left=600'); return false;\"><img src=\"http://lib.store.yahoo.net/lib/yhst-14044557065217/add-details.jpg\" border=\"0\"  width=\"260\" /></a></p></td><td width=\"50%\"><p align=\"center\"> <a href=\"#\" onclick=\"mywindow=window.open('"
    hci.re_dl_code_3_of_3="','MyWindow','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,width=650,height=700,left=600'); return false;\"><img src=\"http://lib.store.yahoo.net/lib/yhst-14044557065217/install-instructions.jpg\" border=\"0\"  width=\"220\" /> </a></p></td></tr></table>"
    hci.re_dl_code_a1="<a href=\"#\" onclick=\"mywindow=window.open('"
    hci.re_dl_code_a1_table="<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> <tr><td width=\"50%\"><p align=\"center\"> <font color=\"blue\" size=\"3\">Need More Product Details? </font><br><font color=\"blue\"> Click below image for Printable PDF </font></p></td><td width=\"50%\"><p align=\"center\"> <font color=\"blue\" size=\"3\">Need Installation Details? </font><br><font color=\"blue\"> Click below image for Printable PDF </font></p></td></tr><tr><td width=\"50%\"><p align=\"center\"> <a href=\"#\" onclick=\"mywindow=window.open('"
    hci.re_dl_code_a2="','MyWindow','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,width=650,height=700,left=600'); return false;\"><img src=\"http://lib.store.yahoo.net/lib/yhst-14044557065217/pdflogo.gif\" align=\"left\" border=\"0\">Download Schematics for This Item </a><h4></h4>"
    hci.re_dl_code_a2_table="','MyWindow','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,width=650,height=700,left=600'); return false;\"> <img src=\"http://lib.store.yahoo.net/lib/yhst-14044557065217/add-details.jpg\" border=\"0\"  width=\"260\"></a></p></td><td width=\"50%\"><p align=\"center\"> <a href=\"#\" onclick=\"mywindow=window.open('"
    hci.man_title_ot="<p style=\"clear:left\"><a name=\"manufacturer-details\"><img src=\"/lib/yhst-14044557065217/Manufacturer-Details.GIF\" alt=\"Manufacturer Details\" width=\"167\" height=\"40\" /></a></p><p style=\"border: 1px solid rgb(204, 204, 204); margin: 5px 0pt; padding: 0px;\"></p> <h3>About"
    hci.man_title_ct="</h3>"
    hci.reference_ot="<p style=\"clear:left\"><img src=\"/lib/yhst-14044557065217/For-Your-Reference.GIF\" alt=\"For-Your-Referrence\" width=\"151\" height=\"40\" /></p><p style=\"border: 1px solid rgb(204, 204, 204); margin: 5px 0pt; padding: 0px;\"></p>OUR SKU is"
    hci.reference_mid_tag="<br /><br />"
    hci.reference_mid_2="is also sometimes referenced as:  <h4>"
    hci.reference_end_tag="</h4>"
    hci.instructions="------The Details Below will SUPERCEDE the Item Number if they conflict----- ------------------------------paste-options-here-------------------------------------------------------- ---Below-this-line-is-for-BudgetMailboxes-Use-Only-please-delete-before-processing-PO---  --------------------------------------------------------------------------------------------------------------- Special Instruction for Processing the PO:"
    hci.shipping_calculator="<a href=\"#\" onclick=\"mywindow=window.open('how-shipping-works2.html','MyWindow','toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=600,height=500'); return false;\" rel=\"nofollow\">Shipping Calculator</a></p>"
    hci.return_detail_open="<a href=\"#\" onclick=\"mywindow=window.open('return-policy.html','MyWindow','toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=600,height=600'); return false;\" rel=\"nofollow\">"
    hci.return_detail_close="</A>"
    hci.save

    




    
  end

  def self.down
    drop_table :stores
    drop_table :hard_code_informations
  end
end
