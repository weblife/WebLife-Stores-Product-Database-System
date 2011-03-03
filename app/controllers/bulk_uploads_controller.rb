class BulkUploadsController < ApplicationController
    layout "layout"

    
  def upload_products_file

     begin
      #params[:page] condition is added due to jump to # feature
      if request.post? and params[:page].blank?
        @products_array,session[:local_file_path]=Product.parse_csv(params[:file],current_user,true)
      elsif ((!params[:page].blank? && !session[:local_file_path].blank?) or (!current_user.cached_information.products_cached_path.nil?))
        @products_array,session[:local_file_path]=Product.parse_csv(session[:local_file_path],current_user,false)
        flash[:notice]="Products are not saved yet" if !current_user.cached_information.products_cached_path.nil?
      elsif current_user.cached_information.products_cached_path.nil? and current_user.cached_information.is_product_info_reverted
        @products_array=Product.find_latest_products(current_user)
        flash[:notice]="#{@products_array.count} product(s) successfully added at #{@products_array.first.created_at.strftime("%a %b %d %H:%M:%S %Y")}" if @products_array
      end

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
      flash[:notice]=nil
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
           pr=Product.find_by_product_id(product.product_id) rescue nil
           if pr
              pr.attributes=product.attributes
              pr.created_at=Time.now
              pr.save(false)
           else
             product.save(false)
           end
           page_no=page_no-1
           flash[:notice]="#{@products_array.count} product(s) successfully added at #{Time.now.strftime("%a %b %d %H:%M:%S %Y")}"
         end
      end
      current_user.cached_information.set_product_reverted
      current_user.cached_information.set_product_cached_file_null
      
      redirect_to :action=>"upload_products_file",:page=>page_no
  end

  def revert_products
      products=Product.find_latest_products(current_user)
      products_count=products.count rescue nil
      products.each do |product|
        product.destroy
      end
      current_user.cached_information.back_product_reverted
      flash[:notice]="#{products_count} latest uploaded product(s) successfully reverted."
      redirect_to upload_path
  end

  def upload_compscraper_file
     begin
      #params[:page] condition is added due to jump to # feature
      if request.post? and params[:page].blank?
        @compscraper_array,session[:local_file_path_cp]=Compscraper.parse_compsraper_csv(params[:file],current_user,true)
      elsif ((!params[:page].blank? && !session[:local_file_path_cp].blank?) or (!current_user.cached_information.compscrapper_cached_path.nil?))
        @compscraper_array,session[:local_file_path_cp]=Compscraper.parse_compsraper_csv(session[:local_file_path_cp],current_user,false)
        flash[:notice]="Compscraper items are not saved yet" if !current_user.cached_information.compscrapper_cached_path.nil?
      elsif current_user.cached_information.compscrapper_cached_path.nil? and current_user.cached_information.is_compscrapper_info_reverted
        @compscraper_array=Compscraper.find_latest_compscraper_items(current_user)
        flash[:notice]="#{@compscraper_array.count rescue 0} item(s) successfully added at #{@compscraper_array.first.created_at.strftime("%a %b %d %H:%M:%S %Y")}" if @compscraper_array
      end
      

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
      @compscraper_array,session[:local_file_path_cp]=Compscraper.parse_compsraper_csv(session[:local_file_path_cp],current_user,false)
      page_no=1
      is_error=false
      @compscraper_array.each do |compp|
          if !compp.valid? && !compp.errors.on(:compscrapper_id).blank?
            is_error=true
            break
          end
          page_no+=1
      end

      if (page_no-1)==@compscraper_array.count && !is_error
        @compscraper_array.each do |comp|
           comp.user_id=current_user.id
           compscraper=Compscraper.find_by_compscrapper_id(comp.compscrapper_id) rescue nil
           if compscraper
            compscraper.attributes=comp.attributes
            compscraper.created_at=Time.now
            compscraper.save(false)
           else
            comp.save(false)
           end
           page_no=page_no-1
        end
        flash[:notice]="#{@compscraper_array.count rescue 0} item(s) successfully added at #{Time.now.strftime("%a %b %d %H:%M:%S %Y")}"
      end
      current_user.cached_information.set_compscraper_reverted
      current_user.cached_information.set_compscraper_cached_file_null

      
      redirect_to :action=>"upload_compscraper_file",:page=>page_no
  end

  def revert_compscraper
      compscrapers=Compscraper.find_latest_compscraper_items(current_user)
      flash[:notice]="#{compscrapers.count rescue 0} latest uploaded item(s) successfully reverted."
      compscrapers.each do |comp|
        comp.destroy
      end
      current_user.cached_information.back_compscraper_reverted
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
