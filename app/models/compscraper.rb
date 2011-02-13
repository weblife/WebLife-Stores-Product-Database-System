# == Schema Information
#
# Table name: compscrapers
#
#  id                 :integer(4)      not null, primary key
#  user_id            :integer(4)      not null
#  item_search_phrase :string(255)
#  word_that_occur    :string(255)
#  sort_options       :string(255)
#  lowest_price       :decimal(8, 2)   default(0.0)
#  decimal            :decimal(8, 2)   default(0.0)
#  lowest_price_2     :decimal(8, 2)   default(0.0)
#  lowest_price_3     :decimal(8, 2)   default(0.0)
#  lowest_price_4     :decimal(8, 2)   default(0.0)
#  lowest_price_5     :decimal(8, 2)   default(0.0)
#  lowest_price_6     :decimal(8, 2)   default(0.0)
#  lowest_site        :string(255)
#  lowest_site_2      :string(255)
#  lowest_site_3      :string(255)
#  lowest_site_4      :string(255)
#  lowest_site_5      :string(255)
#  lowest_site_6      :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

class Compscraper < ActiveRecord::Base

  validates_length_of :item_search_phrase,:allow_nil => true,:maximum   => 100,:too_long  => "Search item phrase must have at most 100 characters"
  validates_length_of :word_that_occur,:allow_nil => true,:maximum   => 100,:too_long  => "word that occur must have at most 100 characters"
  validates_length_of :sort_options,:allow_nil => true,:maximum   => 100,:too_long  => "Sort options must have at most 100 characters"
  validates_length_of :lowest_site,:allow_nil => true,:maximum   => 100,:too_long  => "Lowest site must have at most 100 characters"
  validates_length_of :lowest_site_2,:allow_nil => true,:maximum   => 100,:too_long  => "2nd lowest site must have at most 100 characters"
  validates_length_of :lowest_site_3,:allow_nil => true,:maximum   => 100,:too_long  => "3rd lowest site must have at most 100 characters"
  validates_length_of :lowest_site_4,:allow_nil => true,:maximum   => 100,:too_long  => "4th lowest site must have at most 100 characters"
  validates_length_of :lowest_site_5,:allow_nil => true,:maximum   => 100,:too_long  => "5th lowest site must have at most 100 characters"
  validates_length_of :lowest_site_6,:allow_nil => true,:maximum   => 100,:too_long  => "6th lowest site must have at most 100 characters"

  attr_accessor :minimum_lowest_price

    def self.parse_compsraper_csv(file,current_user,is_uploading_require)
              #uploading file locally
              if is_uploading_require
                file_path=Product.upload_file_locally(file,current_user,"input_compscraper_csv")
              else
                file_path=file
              end

              #sequenced_csv_array=['Item search phrase','Word that occur:','Sort Options:','Lowest Price','2nd','3rd','4th','5th','6th','Lowest Site','2nd Site','3rd Site','4th Site','5th Site','6th Site']
              sequenced_db_array=['item_search_phrase','word_that_occur','sort_options','lowest_price','lowest_price_2','lowest_price_3','lowest_price_4','lowest_price_5','lowest_price_6','lowest_site','lowest_site_2','lowest_site_3','lowest_site_4','lowest_site_5','lowest_site_6']
              params=Hash.new
              compscraper_array=[]
              count=-1
              FasterCSV.foreach(file_path) do |row|
                params["compscraper_#{count}"]=Hash.new
                inner_count=0

                row.each do |cell|
                 params["compscraper_#{count}"]["#{sequenced_db_array[inner_count]}"]=cell
                 inner_count+=1
                end if count!=-1
                 if count!=-1
                  prod=params["compscraper_#{count}"]
                  new_prod=self.new(prod)
                  compscraper_array << new_prod
                 end

                  count+=1
              end
              #File.delete(file_path)
              return compscraper_array,file_path
        end



    def minimum_lowest_price
        lp=[]
        prod=Product.find self.id
        whole_sale=prod.property.wholesale_cost rescue 0
        whole_sale=0.0 if whole_sale.blank?
        lowest_prices = [lowest_price,lowest_price_2,lowest_price_3,lowest_price_4,lowest_price_5,lowest_price_6]
        lowest_sites =[lowest_site,lowest_site_2,lowest_site_3,lowest_site_4,lowest_site_5,lowest_site_6]
        lowest_prices.each_with_index do |price, i|
          lp << ((price > whole_sale) ?(price):(whole_sale)) if lowest_sites[i] != "Budgetmailboxes.com"
        end
        (lp.empty?)?(0):(lp.min)
    end

end
