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

  validates_presence_of :compscrapper_id,:message=>"Id cannot be blank.",:on=>:create
  validates_format_of :compscrapper_id, :with => /^[a-z0-9-]+$/i,:message=>"ID format is invalid.",:allow_nil=>true,:on=>:create
  validate :compscrapper_item_availability,:on=>:create

  validates_length_of :item_search_phrase,:allow_nil => true,:maximum   => 100,:too_long  => "Search item phrase must have at most 100 characters"
  validates_length_of :word_that_occur,:allow_nil => true,:maximum   => 100,:too_long  => "word that occur must have at most 100 characters"
  validates_length_of :sort_options,:allow_nil => true,:maximum   => 100,:too_long  => "Sort options must have at most 100 characters"
  validates_length_of :lowest_site,:allow_nil => true,:maximum   => 100,:too_long  => "Lowest site must have at most 100 characters"
  validates_length_of :lowest_site_2,:allow_nil => true,:maximum   => 100,:too_long  => "2nd lowest site must have at most 100 characters"
  validates_length_of :lowest_site_3,:allow_nil => true,:maximum   => 100,:too_long  => "3rd lowest site must have at most 100 characters"
  validates_length_of :lowest_site_4,:allow_nil => true,:maximum   => 100,:too_long  => "4th lowest site must have at most 100 characters"
  validates_length_of :lowest_site_5,:allow_nil => true,:maximum   => 100,:too_long  => "5th lowest site must have at most 100 characters"
  validates_length_of :lowest_site_6,:allow_nil => true,:maximum   => 100,:too_long  => "6th lowest site must have at most 100 characters"

  attr_accessor :minimum_lowest_price,:compscrapper_id

  belongs_to :product

    def self.parse_compsraper_csv(file,current_user,is_uploading_require)
              #uploading file locally
              if is_uploading_require
                file_path=Product.upload_file_locally(file,current_user,"input_compscraper_csv")
              else
                file_path=file
              end

              #sequenced_csv_array=['Item search phrase','Word that occur:','Sort Options:','Lowest Price','2nd','3rd','4th','5th','6th','Lowest Site','2nd Site','3rd Site','4th Site','5th Site','6th Site']
              sequenced_db_array=['compscrapper_id','item_search_phrase','word_that_occur','sort_options','lowest_price','lowest_price_2','lowest_price_3','lowest_price_4','lowest_price_5','lowest_price_6','lowest_site','lowest_site_2','lowest_site_3','lowest_site_4','lowest_site_5','lowest_site_6']
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

              if is_uploading_require
                current_user.cached_information.back_compscraper_reverted
                current_user.cached_information.set_compscraper_cached_file(file_path)
              end



              return compscraper_array
        end



#    def minimum_lowest_price
#        lp=[]
#        prod=self.product
#        whole_sale=prod.property.wholesale_cost rescue 0
#        whole_sale=0.0 if whole_sale.blank?
#        lowest_prices = [lowest_price,lowest_price_2,lowest_price_3,lowest_price_4,lowest_price_5,lowest_price_6]
#        lowest_sites =[lowest_site,lowest_site_2,lowest_site_3,lowest_site_4,lowest_site_5,lowest_site_6]
#        lowest_prices.each_with_index do |price, i|
#          lp << ((price > whole_sale) ?(price):(whole_sale)) if lowest_sites[i] != "Budgetmailboxes.com"
#        end
#        (lp.empty?)?(0):(lp.min)
#    end
    def minimum_lowest_price
        lp=[]
        prod=self.product
        whole_sale=prod.property.wholesale_cost rescue 0
        whole_sale=0.0 if whole_sale.blank?
        lowest_prices = [lowest_price,lowest_price_2,lowest_price_3,lowest_price_4,lowest_price_5,lowest_price_6]
        lowest_sites =[lowest_site,lowest_site_2,lowest_site_3,lowest_site_4,lowest_site_5,lowest_site_6]
        stores_array=[]
        compscraper_stores = Store.find_compscraper_stores
        compscraper_stores.each{|s| stores_array.push(s.name) } if !compscraper_stores.blank?

        lowest_prices.each_with_index do |price, i|
          lp << price if price.to_f > whole_sale.to_f && !stores_array.include?(lowest_sites[i].to_s.strip) # #lowest_sites[i] != "Budgetmailboxes.com" && lowest_sites[i] != "Budgetcommercial.com" && lowest_sites[i] != "Budgetstreetsigns.com" && lowest_sites[i] != "Budgetstreetlights.com" && lowest_sites[i] != "Budgetaddressplaues.com"
        end
        (lp.empty?)?(0):(lp.min)
    end

  def self.find_latest_compscraper_items(current_user)
      items=self.find(:all,:conditions=>["user_id=? and created_at=?",current_user.id,current_user.cached_information.latest_comp_uploaded_time])
      updated_items=self.find(:all,:conditions=>["user_id=? and updated_at=?",current_user.id,current_user.cached_information.latest_comp_uploaded_time])
      updated_items.each do |item|
        items << item
      end
      items=items.uniq rescue nil
      return items
  end

  def self.count_latest_uploaded_comp_items(user)
      added_items_count=updated_items_count=0
      added_products=self.count(:all,:conditions=>["user_id=? and created_at=?",user.id,user.cached_information.latest_comp_uploaded_time])
      updated_products=self.count(:all,:conditions=>["user_id=? and updated_at=?",user.id,user.cached_information.latest_comp_uploaded_time])
      (added_products==updated_products)?(added_items_count=added_products):(added_items_count=added_products;updated_items_count=(updated_products-added_products))
      return added_items_count,updated_items_count
  end

  private
  def compscrapper_item_availability
      return true if compscrapper_id.blank?
      prd=Product.find(:first,:conditions=>["product_id=?",compscrapper_id])
      errors.add(:compscrapper_id,"Compscraper id not exist in database, will be ignored.") if prd.blank?
  end
end
