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

# == Schema Information
#
# Table name: compscrapers
#
#  id                  :integer(4)      not null, primary key
#  user_id             :integer(4)      not null
#  item_search_phrase  :string(255)
#  word_that_occur     :string(255)
#  sort_options        :string(255)
#  lowest_price        :decimal(8, 2)   default(0.0)
#  decimal             :decimal(8, 2)   default(0.0)
#  second_lowest_price :decimal(8, 2)   default(0.0)
#  third_lowest_price  :decimal(8, 2)   default(0.0)
#  fourth_lowest_price :decimal(8, 2)   default(0.0)
#  fifth_lowest_price  :decimal(8, 2)   default(0.0)
#  sixth_lowest_price  :decimal(8, 2)   default(0.0)
#  lowest_site         :string(255)
#  second_lowest_site  :string(255)
#  third_lowest_site   :string(255)
#  fourth_lowest_site  :string(255)
#  fifth_lowest_site   :string(255)
#  sixth_lowest_site   :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#
  require 'fastercsv'
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
        first_lp=second_lp=third_lp=fourth_lp=fifth_lp=sixth_lp=""
        prod=Product.find self.id
        whole_sale=prod.property.wholesale_cost rescue 0
        first_lp=(lowest_price>whole_sale)?(lowest_price):(whole_sale) if lowest_site!="Budgetmailboxes.com"
        second_lp=(lowest_price_2>whole_sale)?(lowest_price_2):(whole_sale) if lowest_site_2!="Budgetmailboxes.com"
        third_lp=(lowest_price_3>whole_sale)?(lowest_price_3):(whole_sale) if lowest_site_3!="Budgetmailboxes.com"
        fourth_lp=(lowest_price_4>whole_sale)?(lowest_price_4):(whole_sale) if lowest_site_4!="Budgetmailboxes.com"
        fifth_lp=(lowest_price_5>whole_sale)?(lowest_price_5):(whole_sale) if lowest_site_5!="Budgetmailboxes.com"
        sixth_lp=(lowest_price_6>whole_sale)?(lowest_price_6):(whole_sale) if lowest_site_6!="Budgetmailboxes.com"
        [first_lp,second_lp,third_lp,fourth_lp,fifth_lp,sixth_lp].min
    end

end
