class BulkUploadsController < ApplicationController
    layout "layout"

    
  def upload_products_file

     begin
      #params[:page] condition is added due to jump to # feature
      if request.post? and params[:page].blank?
        @products_array,session[:local_file_path]=Product.parse_csv(params[:file],current_user,true)
      end
      @products_array,session[:local_file_path]=Product.parse_csv(session[:local_file_path],current_user,false) if !params[:page].blank? && !session[:local_file_path].blank?

      if  !@products_array.blank?
      paginated_products =  WillPaginate::Collection.new(params[:page].blank? ? 1 : params[:page].to_i,1)
      paginated_products.replace @products_array[paginated_products.offset,paginated_products.per_page]
      paginated_products.total_entries =@products_array.size
      @products=paginated_products
      end
    rescue Exception => exc
      flash[:error]=exc.message
    end

  end

  def save_product_file
      @products_array,session[:local_file_path]=Product.parse_csv(session[:local_file_path],current_user,false)
      page_no=1
      is_error=false
      @products_array.each do |product|
          if !product.valid? && !product.errors.on(:product_id).blank?
            is_error=true
            break
          end
          page_no+=1
      end
      
      if (page_no-1)==@products_array.count && !is_error
         @products_array.each do |product|
           product.user_id=current_user.id
           product.save(false)
           page_no=''
         end
      end
      redirect_to :action=>"upload_products_file",:page=>page_no
  end

  def revert_products
      products=Product.find(:all,:conditions=>["user_id=?",current_user.id],:limit=>params[:id],:order=>"id DESC")
      products.each do |product|
        product.destroy
      end
      
      redirect_to upload_path
  end

  def upload_compscraper_file
     begin
      #params[:page] condition is added due to jump to # feature
      if request.post? and params[:page].blank?
        @compscraper_array,session[:local_file_path]=Compscraper.parse_compsraper_csv(params[:file],current_user,true)
      end
      @compscraper_array,session[:local_file_path]=Compscraper.parse_compsraper_csv(session[:local_file_path],current_user,false) if !params[:page].blank? && !session[:local_file_path].blank?

      if  !@compscraper_array.blank?
        paginated_cps =  WillPaginate::Collection.new(params[:page].blank? ? 1 : params[:page].to_i,1)
        paginated_cps.replace @compscraper_array[paginated_cps.offset,paginated_cps.per_page]
        paginated_cps.total_entries =@compscraper_array.size
        @compscrapers=paginated_cps
      end
    rescue Exception => exc
      logger.error("Message for (upload compscraper file) the log file #{exc.message}")
      flash[:error]=exc.message
    end

  end

  def save_compscraper_file
      @compscraper_array,session[:local_file_path]=Compscraper.parse_compsraper_csv(session[:local_file_path],current_user,false)
      @compscraper_array.each do |comp|
         comp.user_id=current_user.id
         comp.save(false)
      end
      redirect_to upload_compscraper_file_path
  end

  def revert_compscraper
      compscrapers=Compscraper.find(:all,:conditions=>["user_id=?",current_user.id],:limit=>params[:id],:order=>"id DESC")
      compscrapers.each do |comp|
        comp.destroy
      end

      redirect_to upload_compscraper_file_path
  end

  def product_template
      download_file("/public/sample_csv_input_files/items.csv",'product_upload_template.csv')
  end
  def compscraper_template
      download_file("/public/sample_csv_input_files/comprasor.csv",'compscraper_upload_template.csv')
  end

  private
  def download_file(root,filename)
      send_file(RAILS_ROOT + root,:filename => filename)
  end
end
