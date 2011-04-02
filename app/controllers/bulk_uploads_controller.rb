class BulkUploadsController < ApplicationController
    layout "layout"
  before_filter :validate_user
    
  def upload_products_file

     begin
      #params[:page] condition is added due to jump to # feature
      if request.post? and params[:page].blank?
        @products_array=Product.parse_csv(params[:file],current_user,true)
      elsif !current_user.cached_information.products_cached_path.nil?
        @products_array=Product.parse_csv(current_user.cached_information.products_cached_path,current_user,false)
        flash[:notice]="Products are not saved yet" 
      elsif current_user.cached_information.products_cached_path.nil? and current_user.cached_information.is_product_info_reverted
        @products_array=Product.find_latest_products(current_user)
        added_count,updated_count=Product.count_latest_uploaded_products(current_user)
        flash[:notice]="#{added_count} item(s) successfully added at #{current_user.cached_information.latest_products_uploaded_end_time.strftime("%a %b %d %H:%M:%S %p %Z %Y")}" if @products_array && added_count!=0
        flash[:updated_notice]="#{updated_count} item(s) successfully updated at #{current_user.cached_information.latest_products_uploaded_end_time.strftime("%a %b %d %H:%M:%S %p %Z %Y")}" if @products_array && updated_count!=0
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
    #Need to improve that code, will do after periority tasks
      flash[:notice]=session[:duplicate_error]=nil
      @products_array=Product.parse_csv(current_user.cached_information.products_cached_path,current_user,false)
      page_no=1
      is_error=false
      product_ids_array=[]
      @products_array.each do |product|
        product_ids_array.push(product.product_id)
          if !product.valid? && !product.errors.on(:product_id).blank? or !product.property.errors.on(:wholesale_cost).blank? or !product.errors.on(:name).blank?
            is_error=true
            page_no+=1
            break
          end
          page_no+=1
      end
      if !product_ids_array.blank? && !product_ids_array.uniq!.blank?
          is_error=true
      end
      
      if (page_no-1)==@products_array.count && !is_error
         @products_array.each_with_index do |product,index|
           product.user_id=current_user.id
           pr=Product.find_by_product_id(product.product_id) rescue nil
           if pr
              cr_at=pr.created_at
              pr.attributes=product.attributes
              pr.created_at=cr_at
              pr.save(false)
           else
             product.save(false)
           end
           current_user.cached_information.set_products_uploaded_start_time if index==0
           current_user.cached_information.set_products_uploaded_end_time if index==(@products_array.count-1)
           page_no=page_no-1
         end
          added_count,updated_count=Product.count_latest_uploaded_products(current_user)
          flash[:notice]="#{added_count} item(s) successfully added at #{current_user.cached_information.latest_products_uploaded_end_time.strftime("%a %b %d %H:%M:%S %p %Z %Y")}" if @products_array && added_count!=0
          flash[:updated_notice]="#{updated_count} item(s) successfully updated at #{current_user.cached_information.latest_products_uploaded_end_time.strftime("%a %b %d %H:%M:%S %p %Z %Y")}" if @products_array && updated_count!=0

        current_user.cached_information.set_product_reverted
        File.delete(current_user.cached_information.products_cached_path)
        current_user.cached_information.set_product_cached_file_null
      end
      
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
        @compscraper_array=Compscraper.parse_compsraper_csv(params[:file],current_user,true)
      elsif !current_user.cached_information.compscrapper_cached_path.nil?
        @compscraper_array=Compscraper.parse_compsraper_csv(current_user.cached_information.compscrapper_cached_path,current_user,false)
        flash[:notice]="Compscraper items are not saved yet."
      elsif current_user.cached_information.compscrapper_cached_path.nil? and current_user.cached_information.is_compscrapper_info_reverted
        @compscraper_array=Compscraper.find_latest_compscraper_items(current_user)
        added_count,updated_count=Compscraper.count_latest_uploaded_comp_items(current_user)
        flash[:notice]="#{added_count} item(s) successfully added at #{current_user.cached_information.latest_comp_uploaded_end_time.strftime("%a %b %d %H:%M:%S %p %Z %Y")}" if @compscraper_array && added_count!=0
        flash[:updated_notice]="#{updated_count} item(s) successfully updated at #{current_user.cached_information.latest_comp_uploaded_end_time.strftime("%a %b %d %H:%M:%S %p %Z %Y")}" if @compscraper_array && updated_count!=0
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
      @compscraper_array=Compscraper.parse_compsraper_csv(current_user.cached_information.compscrapper_cached_path,current_user,false)
      page_no=1
      is_error=false
      @compscraper_array.each do |compp|
          if !compp.valid? && !compp.errors.on(:compscrapper_id).blank? && compp.errors.on(:compscrapper_id)!="Compscraper id not exist in database, will be ignored."
            is_error=true
            break
          end
          page_no+=1
      end
      if (page_no-1)==@compscraper_array.count && !is_error
        @compscraper_array.each_with_index do |comp,index|
           comp.user_id=current_user.id
           product=Product.find_by_product_id(comp.compscrapper_id)
           compscraper=product.compscraper rescue nil
           if compscraper
             cr_at=compscraper.created_at
            compscraper.attributes=comp.attributes
            compscraper.created_at=cr_at
            compscraper.product=product
            compscraper.save(false)
           elsif product && compscraper.nil?
            comp.product_id=product.id
            comp.save(false)
           end
           page_no=page_no-1
           current_user.cached_information.set_compscraper_uploaded_start_time if index==0
           current_user.cached_information.set_compscraper_uploaded_end_time if index==(@compscraper_array.count-1)
        end
        
        added_count,updated_count=Compscraper.count_latest_uploaded_comp_items(current_user)
        flash[:notice]="#{added_count} item(s) successfully added at #{current_user.cached_information.latest_comp_uploaded_end_time.strftime("%a %b %d %H:%M:%S %p %Z %Y")}" if @compscraper_array && added_count!=0
        flash[:updated_notice]="#{updated_count} item(s) successfully updated at #{current_user.cached_information.latest_comp_uploaded_end_time.strftime("%a %b %d %H:%M:%S %p %Z %Y")}" if @compscraper_array && updated_count!=0
        current_user.cached_information.set_compscraper_reverted
        File.delete(current_user.cached_information.compscrapper_cached_path)
        current_user.cached_information.set_compscraper_cached_file_null
      end

      
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
      download_file("/input_files/sample_csv_input_files/items.csv",'product_upload_template.csv')
  end
  def compscraper_template
      download_file("/input_files/sample_csv_input_files/comprasor.csv",'compscraper_upload_template.csv')
  end

  private
  def download_file(root,filename)
      send_file(RAILS_ROOT + root,:filename => filename)
  end
end
