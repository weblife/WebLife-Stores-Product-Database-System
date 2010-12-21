class Compscraper < ActiveRecord::Base

  validates_length_of :item_search_phrase,
                      :allow_nil => true,
                      :maximum   => 100,
                      :too_long  => "Search item phrase must have at most 100 characters"


  validates_length_of :word_that_occur,
                      :allow_nil => true,
                      :maximum   => 100,
                      :too_long  => "word that occur must have at most 100 characters"

  validates_length_of :sort_options,
                      :allow_nil => true,
                      :maximum   => 100,
                      :too_long  => "Sort options must have at most 100 characters"

  validates_length_of :lowest_site,
                      :allow_nil => true,
                      :maximum   => 100,
                      :too_long  => "Lowest site must have at most 100 characters"

  validates_length_of :second_lowest_site,
                      :allow_nil => true,
                      :maximum   => 100,
                      :too_long  => "2nd lowest site must have at most 100 characters"

  validates_length_of :third_lowest_site,
                      :allow_nil => true,
                      :maximum   => 100,
                      :too_long  => "3rd lowest site must have at most 100 characters"

  validates_length_of :fourth_lowest_site,
                      :allow_nil => true,
                      :maximum   => 100,
                      :too_long  => "4th lowest site must have at most 100 characters"


  validates_length_of :fifth_lowest_site,
                      :allow_nil => true,
                      :maximum   => 100,
                      :too_long  => "5th lowest site must have at most 100 characters"

  validates_length_of :sixth_lowest_site,
                      :allow_nil => true,
                      :maximum   => 100,
                      :too_long  => "6th lowest site must have at most 100 characters"

   attr_accessor :minimum_lowest_price

    def self.parse_compsraper_csv(file,current_user,is_uploading_require)
              #uploading file locally
              if is_uploading_require
                file_path=Product.upload_file_locally(file,current_user,"input_compscraper_csv")
              else
                file_path=file
              end

              #sequenced_csv_array=['Item search phrase','Word that occur:','Sort Options:','Lowest Price','2nd','3rd','4th','5th','6th','Lowest Site','2nd Site','3rd Site','4th Site','5th Site','6th Site']
              sequenced_db_array=['item_search_phrase','word_that_occur','sort_options','lowest_price','second_lowest_price','third_lowest_price','fourth_lowest_price','fifth_lowest_price','sixth_lowest_price','lowest_site','second_lowest_site','third_lowest_site','fourth_lowest_site','fifth_lowest_site','sixth_lowest_site']
              params=Hash.new
              compscraper_array=[]
              count=-1
              FasterCSV.foreach(file_path) do |row|
                params["compscraper_#{count}"]=Hash.new
                inner_count=0

                row.each do |cell|
                      params["compscraper_#{count}"].store("#{sequenced_db_array[inner_count]}",cell)

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
        whole_sale=0
        prod=Product.find self.id
        whole_sale=prod.property.wholesale_cost rescue nil
        first_lp=(lowest_price>whole_sale)?(lowest_price):(whole_sale) if lowest_site!="Budgetmailboxes.com"
        second_lp=(second_lowest_price>whole_sale)?(second_lowest_price):(whole_sale) if second_lowest_site!="Budgetmailboxes.com"
        third_lp=(third_lowest_price>whole_sale)?(third_lowest_price):(whole_sale) if third_lowest_site!="Budgetmailboxes.com"
        fourth_lp=(fourth_lowest_price>whole_sale)?(fourth_lowest_price):(whole_sale) if fourth_lowest_site!="Budgetmailboxes.com"
        fifth_lp=(fifth_lowest_price>whole_sale)?(fifth_lowest_price):(whole_sale) if fifth_lowest_site!="Budgetmailboxes.com"
        sixth_lp=(sixth_lowest_price>whole_sale)?(sixth_lowest_price):(whole_sale) if sixth_lowest_site!="Budgetmailboxes.com"

        Compscraper.min_from_array([first_lp,second_lp,third_lp,fourth_lp,fifth_lp,sixth_lp])
    end

  def self.min_from_array(array)

    mn = array[0];
    i=0
    while (i<array.length)
      if (array[i]<mn)
        mn = array[i];
      end
      i+=1
    end
    return mn
  end

end
