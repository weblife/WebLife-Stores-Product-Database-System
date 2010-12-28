class RenamingComscrapperFields < ActiveRecord::Migration
  def self.up
     rename_column :compscrapers,:second_lowest_price, :lowest_price_2
     rename_column :compscrapers,:third_lowest_price, :lowest_price_3
     rename_column :compscrapers,:fourth_lowest_price, :lowest_price_4
     rename_column :compscrapers,:fifth_lowest_price, :lowest_price_5
     rename_column :compscrapers,:sixth_lowest_price, :lowest_price_6

     rename_column :compscrapers,:second_lowest_site, :lowest_site_2
     rename_column :compscrapers,:third_lowest_site, :lowest_site_3
     rename_column :compscrapers,:fourth_lowest_site, :lowest_site_4
     rename_column :compscrapers,:fifth_lowest_site, :lowest_site_5
     rename_column :compscrapers,:sixth_lowest_site, :lowest_site_6
  end

  def self.down
     rename_column :compscrapers, :lowest_price_2,:second_lowest_price
     rename_column :compscrapers, :lowest_price_3,:third_lowest_price
     rename_column :compscrapers, :lowest_price_4,:fourth_lowest_price
     rename_column :compscrapers, :lowest_price_5,:fifth_lowest_price
     rename_column :compscrapers, :lowest_price_6,:sixth_lowest_price

     rename_column :compscrapers, :lowest_site_2,:second_lowest_site
     rename_column :compscrapers, :lowest_site_3,:third_lowest_site
     rename_column :compscrapers, :lowest_site_4,:fourth_lowest_site
     rename_column :compscrapers, :lowest_site_5,:fifth_lowest_site
     rename_column :compscrapers, :lowest_site_6,:sixth_lowest_site

  end
end
