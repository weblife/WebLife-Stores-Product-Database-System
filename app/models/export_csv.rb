class ExportCsv
  require 'zip/zip'
  BUDGET_MAILBOXES=1
  BUDGET_COMMERCIAL_MAILBOXES=2
  BUDGET_ADDRESS_PLAQUE=3
  BUDGET_STREET_SIGNS=4
  QUICKBOOKS=5
  COMPSCRAPER=6


  def self.export_csv(search,searched_field,searched_text)
      products=Product.search_products(searched_field,searched_text)
      file_path=export_budgetmailboxes(products) if search[:store_csv].to_i==BUDGET_MAILBOXES
      file_path=export_budgetcommercialmailboxes(products) if search[:store_csv].to_i==BUDGET_COMMERCIAL_MAILBOXES
      file_path=export_addressplaques(products) if search[:store_csv].to_i==BUDGET_ADDRESS_PLAQUE
      file_path=export_streetsign(products) if search[:store_csv].to_i==BUDGET_STREET_SIGNS
      file_path=export_quickbooks(products) if search[:other_csv].to_i==QUICKBOOKS
      file_path=export_compscraper(products) if search[:other_csv].to_i==COMPSCRAPER
      return file_path
  end

  def self.export_as_zip(export,user)
      products=Product.find_recent_products(export[:time])
      export[:stores]=["1","2","3","4","5","6"] if export[:stores].nil?
      export[:stores].delete("")
      file= "#{RAILS_ROOT}/input_files/zip_files/stores.zip" #local directory path
      File.delete(file)
      Zip::ZipFile.open(file, Zip::ZipFile::CREATE) {|zipfile|
        export[:stores].each do |num|
          file_path=export_budgetmailboxes(products) if num.to_i==BUDGET_MAILBOXES
          file_path=export_budgetcommercialmailboxes(products) if num.to_i==BUDGET_COMMERCIAL_MAILBOXES
          file_path=export_addressplaques(products) if num.to_i==BUDGET_ADDRESS_PLAQUE
          file_path=export_streetsign(products) if num.to_i==BUDGET_STREET_SIGNS
          file_path=export_quickbooks(products) if num.to_i==QUICKBOOKS
          file_path=export_compscraper(products) if num.to_i==COMPSCRAPER
          zipfile.add("#{file_path.split("/").last.split(" ").first}.csv",file_path)
        end
      }

      return file
  end

  private

  def self.export_budgetmailboxes(products)
        header=['id','Product-url','Path','Manufacturer','code','name','sale-price','price','caption','Options','Ship-weight','Availability','Warranty','Shipping-Time','Free-shipping','USPS','Shipping-Costs','description','Image', 'Inset','Inset-2','Inset-3','Inset-4','Inset-5','Inset-6','Inset-7','Inset-8','Inset-9','material','style','color','Model-number','Flat-ship-rate','Free-ship-method','Ship-weight','Taxable','Dimensions','Ship-alone','Origin-zip','Number-of-boxes','Multi-box-weights','Multi-box-dimensions','Invalid-ship-methods','Related-items','Phone-number','Item-number-visiblity','overall-size','Return-details','good-margins','size-for-data-feeds','ships-within-for-feeds','disclaimer-name','disclaimer-text','name-for-feed-under-70','Et-right-order','Et-right-break','Et-right-cross','et-right-feature','last-updated']
        create_file(header,products,"budgetmailboxes-#{Time.now.strftime("%d-%m-%Y %H:%M")}",1)
  end

  def self.export_budgetcommercialmailboxes(products)
        header=['id','Product-url','path','Manufacturer','code','name','sale-price','price','caption','Options','Ship-weight','Availability','Warranty','Shipping-Time','Free-shipping','USPS','Shipping-Costs','description','Image','Inset','Inset-2','Inset-3','Inset-4','Inset-5','Inset-6','Inset-7','Inset-8','Inset-9','material','style','color','Model-number','Flat-ship-rate','Free-ship-method','Ship-weight','Taxable','Dimensions','Ship-alone','Origin-zip','Number-of-boxes','Multi-box-weights','Multi-box-dimensions','Invalid-ship-methods','Related-items','Phone-number','Item-number-visiblity','size','Return-details','good-margins','size-for-data-feeds','ships-within-for-feeds','name-for-feed-under-70','Et-right-order','Et-right-break','Et-right-cross','et-right-feature','last-updated']
        create_file(header,products,"budgetcommercialmailboxes-#{Time.now.strftime("%d-%m-%Y %H:%M")}",2)
  end

  def self.export_addressplaques(products)
        header=['id','Product-url','path','Manufacturer','code','name','sale-price','price','caption','Options','Ship-weight','Availability','Warranty','Shipping-Time','Free-shipping','USPS','Shipping-Costs','description','Image','Inset','Inset-2','Inset-3','Inset-4','Inset-5','Inset-6','Inset-7','Inset-8','Inset-9','material','style','color','Model-number','Flat-ship-rate','Free-ship-method','Ship-weight','Taxable','Dimensions','Ship-alone','Origin-zip','Number-of-boxes','Multi-box-weights','Multi-box-dimensions','Invalid-ship-methods','Related-items','Phone-number','Item-number-visiblity','size','Return-details','good-margins','size-for-data-feeds','ships-within-for-feeds','name-for-feed-under-70','Et-right-order','Et-right-break','Et-right-cross','et-right-feature','last-updated']
        create_file(header,products,"budgetaddressplaques-#{Time.now.strftime("%d-%m-%Y %H:%M")}",3)
  end

  def self.export_streetsign(products)
        header=['id','Product-url','path','Manufacturer','code','name','sale-price','price','caption','Options','Ship-weight','Availability','Warranty','Shipping-Time','Free-shipping','USPS','Shipping-Costs','description','Image','Inset','Inset-2','Inset-3','Inset-4','Inset-5','Inset-6','Inset-7','Inset-8','Inset-9','material','style','color','Model-number','Flat-ship-rate','Free-ship-method','Ship-weight','Taxable','Dimensions','Ship-alone','Origin-zip','Number-of-boxes','Multi-box-weights','Multi-box-dimensions','Invalid-ship-methods','Related-items','Phone-number','Item-number-visiblity','size','Return-details','good-margins','size-for-data-feeds','ships-within-for-feeds','name-for-feed-under-70','Et-right-order','Et-right-break','Et-right-cross','et-right-feature','last-updated']
        create_file(header,products,"budgetstreetsign-#{Time.now.strftime("%d-%m-%Y %H:%M")}",4)
  end

  def self.export_quickbooks(products)
        header=['Active Status','item','Description','Type','Purchase Description','COGS Account','Cost','Price','Account','Sales Tax Code','Preferred Vendor','Purchased for Resale','Is New','MPN']
        create_file(header,products,"quickbooks-#{Time.now.strftime("%d-%m-%Y %H:%M")}",5)
  end
  def self.export_compscraper(products)
        header=['id','Item search phrase','Word that occur','Sort Options','Lowest Price','2nd','3rd','4th','5th','6th','Lowest Site','2nd Site','3rd Site','4th Site','5th Site','6th Site']
        create_file(header,products,"compscraper-#{Time.now.strftime("%d-%m-%Y %H:%M")}",6)
  end


  def self.create_file(header,products,name,type)
      file= "#{RAILS_ROOT}/input_files/#{name}.csv" #local directory path
      outfile = File.open(file, 'wb')
      FasterCSV.open(file,"w") do |title|
         title << header
         products.each do |product|
           if type==BUDGET_MAILBOXES
             title << FasterCSV::Row.new(header,[product.product_id,product.output_product_url,product.path,product.manufacturer,product.code,product.name,product.output_sale_price,(product.output_sale_price*1.25).round(2),product.output_caption,product.options,product.output_ship_weight,product.availability,product.warranty,product.shipping_time,(product.output_free_shipping)?("Yes"):("No"),(product.is_usps_approved)?("Yes"):("No"),product.output_shipping_costs,product.output_description,product.image,product.inset.inset,product.inset.inset_2,product.inset.inset_3,product.inset.inset_4,product.inset.inset_5,product.inset.inset_6,product.inset.inset_7,product.inset.inset_8,product.inset.inset_9,product.property.material,product.property.style,product.property.color,product.output_model_no,(product.output_free_shipping)?(0):(""),product.free_ship_method,product.property.ship_weight,(product.taxable)?("Yes"):("NO"),"",(product.ship_alone)?("Yes"):("No"),product.origin_zip,product.property.number_of_boxes,product.property.multi_box_weights,product.property.multi_box_dimensions,product.invalid_ship_methods,product.related_Items,(product.phone_number_visibility)?("Yes"):("No"),(product.item_number_visiblity)?("Yes"):("No"),product.property.overall_size,product.output_return_details,product.output_good_margins,product.output_size_for_data_feeds,product.output_ships_within_for_feed,product.disclaimer_name,product.disclaimer_text,product.output_need_for_feed_under_70,product.output_et_right_order,product.output_et_right_break,product.output_et_right_cross,product.output_et_right_feature,Time.now.strftime("%d-%m-%Y")])
           elsif type==BUDGET_COMMERCIAL_MAILBOXES
             title << FasterCSV::Row.new(header,[product.product_id,"http://www.budgetcommercialmailboxes.com/#{product.product_id}.html",product.path,product.manufacturer,product.code,product.name,product.output_sale_price.to_f*product.commercial_adjustment_rate.to_f,(product.output_sale_price.to_f*product.commercial_adjustment_rate.to_f*1.25).round(2),product.output_caption,product.options,product.output_ship_weight,product.availability,product.warranty,product.shipping_time,(product.commercial_free_shipping)?("Yes"):("No"),(product.is_usps_approved)?("Yes"):("No"),product.output_shipping_costs,product.Item_description_with_html,product.image,product.inset.inset,product.inset.inset_2,product.inset.inset_3,product.inset.inset_4,product.inset.inset_5,product.inset.inset_6,product.inset.inset_7,product.inset.inset_8,product.inset.inset_9,product.property.material,product.property.style,product.property.color,product.output_model_no,(product.commercial_free_shipping)?(0):(""),product.free_ship_method,product.property.ship_weight,(product.taxable)?("Yes"):("NO"),"",(product.ship_alone)?("Yes"):("No"),product.origin_zip,product.property.number_of_boxes,product.property.multi_box_weights,product.property.multi_box_dimensions,product.invalid_ship_methods,product.related_Items,(product.phone_number_visibility)?("Yes"):("No"),(product.item_number_visiblity)?("Yes"):("No"),product.property.overall_size,product.output_return_details,product.output_good_margins,product.output_size_for_data_feeds,product.output_ships_within_for_feed,product.output_need_for_feed_under_70,product.output_et_right_order,product.output_et_right_break,product.output_et_right_cross,product.output_et_right_feature,Time.now.strftime("%d-%m-%Y")])
           elsif type==BUDGET_ADDRESS_PLAQUE
             title << FasterCSV::Row.new(header,[product.product_id,"http://www.budgetaddressplaques.com/#{product.product_id}.html",product.path,product.manufacturer,product.code,product.name+" for sale at Budget Address Plaques",(product.output_sale_price.to_f*product.commercial_adjustment_rate.to_f*product.addressplaq_adjustment.to_f),((product.output_sale_price.to_f*product.commercial_adjustment_rate.to_f*product.addressplaq_adjustment.to_f*1.25).round(2)),product.output_caption,product.options,product.output_ship_weight,product.availability,product.warranty,product.shipping_time,(product.addressplaq_free_shipping)?("Yes"):("No"),(product.is_usps_approved)?("Yes"):("No"),product.output_shipping_costs,product.Item_description_with_html,product.image,product.inset.inset,product.inset.inset_2,product.inset.inset_3,product.inset.inset_4,product.inset.inset_5,product.inset.inset_6,product.inset.inset_7,product.inset.inset_8,product.inset.inset_9,product.property.material,product.property.style,product.property.color,product.output_model_no,(product.addressplaq_free_shipping)?(0):(""),product.free_ship_method,product.property.ship_weight,(product.taxable)?("Yes"):("NO"),"",(product.ship_alone)?("Yes"):("No"),product.origin_zip,product.property.number_of_boxes,product.property.multi_box_weights,product.property.multi_box_dimensions,product.invalid_ship_methods,product.related_Items,(product.phone_number_visibility)?("Yes"):("No"),(product.item_number_visiblity)?("Yes"):("No"),product.property.overall_size,product.output_return_details,product.output_good_margins,product.output_size_for_data_feeds,product.output_ships_within_for_feed,product.output_need_for_feed_under_70,product.output_et_right_order,product.output_et_right_break,product.output_et_right_cross,product.output_et_right_feature,Time.now.strftime("%d-%m-%Y")])
           elsif type==BUDGET_STREET_SIGNS
             title << FasterCSV::Row.new(header,[product.product_id,"http://www.budgetstreetsigns.com/#{product.product_id}.html",product.path,product.manufacturer,product.code,product.name+" by Budget Street Signs",(product.output_sale_price.to_f*product.commercial_adjustment_rate.to_f*product.streetsign_adjustment.to_f),((product.output_sale_price.to_f*product.commercial_adjustment_rate.to_f*product.streetsign_adjustment.to_f*1.25).round(2)),product.output_caption,product.options,product.output_ship_weight,product.availability,product.warranty,product.shipping_time,(product.streetsign_free_shipping)?("Yes"):("No"),(product.is_usps_approved)?("Yes"):("No"),product.output_shipping_costs,product.Item_description_with_html,product.image,product.inset.inset,product.inset.inset_2,product.inset.inset_3,product.inset.inset_4,product.inset.inset_5,product.inset.inset_6,product.inset.inset_7,product.inset.inset_8,product.inset.inset_9,product.property.material,product.property.style,product.property.color,product.output_model_no,(product.streetsign_free_shipping)?(0):(""),product.free_ship_method,product.property.ship_weight,(product.taxable)?("Yes"):("NO"),"",(product.ship_alone)?("Yes"):("No"),product.origin_zip,product.property.number_of_boxes,product.property.multi_box_weights,product.property.multi_box_dimensions,product.invalid_ship_methods,product.related_Items,(product.phone_number_visibility)?("Yes"):("No"),(product.item_number_visiblity)?("Yes"):("No"),product.property.overall_size,product.output_return_details,product.output_good_margins,product.output_size_for_data_feeds,product.output_ships_within_for_feed,product.output_need_for_feed_under_70,product.output_et_right_order,product.output_et_right_break,product.output_et_right_cross,product.output_et_right_feature,Time.now.strftime("%d-%m-%Y")])
           elsif type==QUICKBOOKS
             title << FasterCSV::Row.new(header,[product.active_status,product.output_item,product.name,product.product_type,product.output_purchase_description,product.cogs_account,product.property.wholesale_cost,product.output_sale_price,product.account,product.sales_tax_code,product.manufacturer,product.purchased_for_resale,product.is_new,product.code])
           elsif type==COMPSCRAPER
             title << FasterCSV::Row.new(header,[product.product_id,product.compscraper.item_search_phrase,product.compscraper.word_that_occur,product.compscraper.sort_options,product.compscraper.lowest_price,product.compscraper.lowest_price_2,product.compscraper.lowest_price_3,product.compscraper.lowest_price_4,product.compscraper.lowest_price_5,product.compscraper.lowest_price_6,product.compscraper.lowest_site,product.compscraper.lowest_site_2,product.compscraper.lowest_site_3,product.compscraper.lowest_site_4,product.compscraper.lowest_site_5,product.compscraper.lowest_site_6])
           end
         end
      end
      outfile.close
      return file
  end
end
